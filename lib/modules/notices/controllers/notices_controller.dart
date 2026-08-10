import 'package:get/get.dart';
import 'package:isar_community/isar.dart';

import '../../../data/models/notice_model.dart';
import '../../../data/models/student_model.dart';
import '../../../data/models/user_model.dart';
import '../../../data/services/database_service.dart';
import '../../auth/controllers/auth_controller.dart';

class NoticesController extends GetxController {
  final RxList<NoticeModel> notices = <NoticeModel>[].obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  Future<void> _load() async {
    isLoading.value = true;
    final isar = DatabaseService.instance;
    final all = await isar.noticeModels.where().sortByPostedAtDesc().findAll();

    final user = AuthController.to.currentUser.value;

    // Non-students (faculty/admin) see everything. Students only see notices
    // targeted at their department/year, or campus-wide notices (null filters).
    if (user == null || user.role != UserRole.student || user.studentProfileId == null) {
      notices.value = all;
      isLoading.value = false;
      return;
    }

    final StudentModel? profile = await isar.studentModels.get(user.studentProfileId!);
    if (profile == null) {
      notices.value = all;
      isLoading.value = false;
      return;
    }

    notices.value = all.where((n) {
      final deptMatches = n.departmentFilter == null || n.departmentFilter == profile.department;
      final yearMatches = n.yearFilter == null || n.yearFilter == profile.yearOfStudy;
      return deptMatches && yearMatches;
    }).toList();

    isLoading.value = false;
  }

  Future<void> refresh() => _load();
}
