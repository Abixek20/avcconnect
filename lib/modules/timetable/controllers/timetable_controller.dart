import 'package:get/get.dart';
import 'package:isar_community/isar.dart';

import '../../../data/models/class_slot_model.dart';
import '../../../data/models/attendance_model.dart';
import '../../../data/models/student_model.dart';
import '../../../data/services/database_service.dart';
import '../../auth/controllers/auth_controller.dart';

class TimetableController extends GetxController {
  final RxList<ClassSlotModel> todaysSlots = <ClassSlotModel>[].obs;
  final RxMap<WeekDay, List<ClassSlotModel>> weekSlots = <WeekDay, List<ClassSlotModel>>{}.obs;
  final RxDouble attendancePercent = 0.0.obs;
  final RxBool isLoading = true.obs;

  StudentModel? _studentProfile;

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  Future<void> _load() async {
    isLoading.value = true;
    final isar = DatabaseService.instance;
    final user = AuthController.to.currentUser.value;

    if (user?.studentProfileId == null) {
      isLoading.value = false;
      return;
    }

    _studentProfile = await isar.studentModels.get(user!.studentProfileId!);
    if (_studentProfile == null) {
      isLoading.value = false;
      return;
    }

    final slots = await isar.classSlotModels
        .filter()
        .departmentEqualTo(_studentProfile!.department)
        .and()
        .yearOfStudyEqualTo(_studentProfile!.yearOfStudy)
        .and()
        .sectionEqualTo(_studentProfile!.section)
        .findAll();

    final grouped = <WeekDay, List<ClassSlotModel>>{};
    for (final slot in slots) {
      grouped.putIfAbsent(slot.day, () => []).add(slot);
    }
    for (final list in grouped.values) {
      list.sort((a, b) => a.startTime.compareTo(b.startTime));
    }
    weekSlots.value = grouped;

    final today = WeekDay.values[DateTime.now().weekday - 1 < 6 ? DateTime.now().weekday - 1 : 0];
    todaysSlots.value = grouped[today] ?? [];

    await _computeAttendance(isar);

    isLoading.value = false;
  }

  Future<void> _computeAttendance(Isar isar) async {
    if (_studentProfile == null) return;

    final records = await isar.attendanceModels
        .filter()
        .studentProfileIdEqualTo(_studentProfile!.id)
        .findAll();

    if (records.isEmpty) {
      attendancePercent.value = 0;
      return;
    }

    final present = records.where((r) => r.status == AttendanceStatus.present).length;
    attendancePercent.value = (present / records.length) * 100;
  }
}