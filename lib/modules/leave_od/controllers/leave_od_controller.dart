import 'package:get/get.dart';
import 'package:isar_community/isar.dart';

import '../../../data/models/leave_application_model.dart';
import '../../../data/models/student_model.dart';
import '../../../data/models/user_model.dart';
import '../../../data/services/database_service.dart';
import '../../auth/controllers/auth_controller.dart';

class LeaveOdController extends GetxController {
  final RxList<LeaveApplicationModel> applications = <LeaveApplicationModel>[].obs;
  final RxBool isLoading = true.obs;
  final RxBool isSubmitting = false.obs;
  final RxnString errorMessage = RxnString();

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  Future<void> _load() async {
    isLoading.value = true;
    final isar = DatabaseService.instance;
    final user = AuthController.to.currentUser.value;

    if (user != null) {
      if (user.role == UserRole.student && user.studentProfileId != null) {
        final list = await isar.leaveApplicationModels
            .filter()
            .studentProfileIdEqualTo(user.studentProfileId!)
            .sortByAppliedAtDesc()
            .findAll();
        applications.value = list;
      } else {
        // Faculty / Admin sees all applications (or filtered by department)
        final list = await isar.leaveApplicationModels.where().sortByAppliedAtDesc().findAll();
        applications.value = list;
      }
    }

    isLoading.value = false;
  }

  Future<bool> applyLeave({
    required LeaveType type,
    required String reason,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    if (reason.trim().isEmpty) {
      errorMessage.value = 'Please state your reason for leave/OD';
      return false;
    }

    if (endDate.isBefore(startDate)) {
      errorMessage.value = 'End date cannot be before start date';
      return false;
    }

    isSubmitting.value = true;
    errorMessage.value = null;

    final isar = DatabaseService.instance;
    final user = AuthController.to.currentUser.value;

    if (user == null || user.studentProfileId == null) {
      errorMessage.value = 'Student profile not found';
      isSubmitting.value = false;
      return false;
    }

    final student = await isar.studentModels.get(user.studentProfileId!);

    final totalDays = endDate.difference(startDate).inDays + 1;

    final app = LeaveApplicationModel()
      ..studentProfileId = student!.id
      ..studentName = user.name
      ..rollNumber = student.rollNumber
      ..department = student.department
      ..yearOfStudy = student.yearOfStudy
      ..section = student.section
      ..type = type
      ..reason = reason.trim()
      ..startDate = startDate
      ..endDate = endDate
      ..totalDays = totalDays > 0 ? totalDays : 1
      ..status = LeaveStatus.pending
      ..appliedAt = DateTime.now();

    await isar.writeTxn(() async {
      await isar.leaveApplicationModels.put(app);
    });

    isSubmitting.value = false;
    _load();
    return true;
  }

  Future<void> reviewApplication({
    required LeaveApplicationModel app,
    required LeaveStatus newStatus,
    required String remarks,
  }) async {
    final isar = DatabaseService.instance;
    final user = AuthController.to.currentUser.value;

    await isar.writeTxn(() async {
      app.status = newStatus;
      app.remarksByFaculty = remarks.trim();
      app.reviewedByUserId = user?.id;
      app.reviewedAt = DateTime.now();
      await isar.leaveApplicationModels.put(app);
    });

    _load();
  }

  Future<void> refresh() => _load();
}
