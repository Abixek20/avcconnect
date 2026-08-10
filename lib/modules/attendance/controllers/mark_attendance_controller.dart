import 'package:get/get.dart';
import 'package:isar_community/isar.dart';

import '../../../data/models/attendance_model.dart';
import '../../../data/models/class_slot_model.dart';
import '../../../data/models/faculty_model.dart';
import '../../../data/models/student_model.dart';
import '../../../data/services/database_service.dart';

class RosterEntry {
  final StudentModel student;
  final Rx<AttendanceStatus> status;

  RosterEntry(this.student, AttendanceStatus initial) : status = initial.obs;
}

class MarkAttendanceController extends GetxController {
  final ClassSlotModel slot;
  final FacultyModel facultyProfile;

  MarkAttendanceController({required this.slot, required this.facultyProfile});

  final Rx<DateTime> selectedDate = DateTime.now().obs;
  final RxList<RosterEntry> roster = <RosterEntry>[].obs;
  final RxBool isLoading = true.obs;
  final RxBool isSaving = false.obs;
  final RxBool justSaved = false.obs;

  DateTime get _truncatedDate {
    final d = selectedDate.value;
    return DateTime(d.year, d.month, d.day);
  }

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  Future<void> changeDate(DateTime date) async {
    selectedDate.value = date;
    justSaved.value = false;
    await _load();
  }

  Future<void> _load() async {
    isLoading.value = true;
    final isar = DatabaseService.instance;

    final students = await isar.studentModels
        .filter()
        .departmentEqualTo(slot.department)
        .and()
        .yearOfStudyEqualTo(slot.yearOfStudy)
        .and()
        .sectionEqualTo(slot.section)
        .findAll();
    students.sort((a, b) => a.rollNumber.compareTo(b.rollNumber));

    final existing = await isar.attendanceModels
        .filter()
        .classSlotIdEqualTo(slot.id)
        .and()
        .dateEqualTo(_truncatedDate)
        .findAll();

    final existingByStudent = {for (final r in existing) r.studentProfileId: r.status};

    roster.value = students
        .map((s) => RosterEntry(s, existingByStudent[s.id] ?? AttendanceStatus.present))
        .toList();

    isLoading.value = false;
  }

  void toggle(RosterEntry entry) {
    entry.status.value =
        entry.status.value == AttendanceStatus.present ? AttendanceStatus.absent : AttendanceStatus.present;
    justSaved.value = false;
  }

  void markAllPresent() {
    for (final entry in roster) {
      entry.status.value = AttendanceStatus.present;
    }
    justSaved.value = false;
  }

  int get presentCount => roster.where((r) => r.status.value == AttendanceStatus.present).length;

  Future<void> save() async {
    isSaving.value = true;
    final isar = DatabaseService.instance;
    final date = _truncatedDate;

    await isar.writeTxn(() async {
      final existing = await isar.attendanceModels
          .filter()
          .classSlotIdEqualTo(slot.id)
          .and()
          .dateEqualTo(date)
          .findAll();
      final existingByStudent = {for (final r in existing) r.studentProfileId: r};

      for (final entry in roster) {
        final record = existingByStudent[entry.student.id] ?? AttendanceModel();
        record
          ..studentProfileId = entry.student.id
          ..classSlotId = slot.id
          ..date = date
          ..status = entry.status.value
          ..markedByFacultyId = facultyProfile.id;
        await isar.attendanceModels.put(record);
      }
    });

    isSaving.value = false;
    justSaved.value = true;
  }
}
