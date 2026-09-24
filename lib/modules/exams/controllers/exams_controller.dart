import 'package:get/get.dart';
import 'package:isar_community/isar.dart';

import '../../../data/models/exam_schedule_model.dart';
import '../../../data/models/semester_record_model.dart';
import '../../../data/models/subject_grade_model.dart';
import '../../../data/models/student_model.dart';
import '../../../data/services/database_service.dart';
import '../../auth/controllers/auth_controller.dart';

class ExamsController extends GetxController {
  final RxList<ExamScheduleModel> schedules = <ExamScheduleModel>[].obs;
  final RxList<SemesterRecordModel> semesterRecords = <SemesterRecordModel>[].obs;
  final RxMap<int, List<SubjectGradeModel>> subjectGradesMap = <int, List<SubjectGradeModel>>{}.obs;
  final Rxn<StudentModel> studentProfile = Rxn<StudentModel>();

  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  Future<void> _load() async {
    isLoading.value = true;
    final isar = DatabaseService.instance;
    final user = AuthController.to.currentUser.value;

    if (user != null && user.studentProfileId != null) {
      final student = await isar.studentModels.get(user.studentProfileId!);
      studentProfile.value = student;

      if (student != null) {
        // Load exam schedules matching student's department & year
        final examList = await isar.examScheduleModels
            .filter()
            .departmentEqualTo(student.department)
            .and()
            .yearOfStudyEqualTo(student.yearOfStudy)
            .sortByExamDate()
            .findAll();
        schedules.value = examList;

        // Load semester results
        final semList = await isar.semesterRecordModels
            .filter()
            .studentProfileIdEqualTo(student.id)
            .sortBySemesterNumberDesc()
            .findAll();
        semesterRecords.value = semList;

        final gradesMap = <int, List<SubjectGradeModel>>{};
        for (final sem in semList) {
          final grades = await isar.subjectGradeModels
              .filter()
              .semesterRecordIdEqualTo(sem.id)
              .findAll();
          gradesMap[sem.id] = grades;
        }
        subjectGradesMap.value = gradesMap;
      }
    } else {
      // Admin/Faculty demo view
      schedules.value = await isar.examScheduleModels.where().sortByExamDate().findAll();
    }

    isLoading.value = false;
  }

  Future<void> refresh() => _load();
}
