import 'package:get/get.dart';
import 'package:isar_community/isar.dart';

import '../../../data/models/notice_model.dart';
import '../../../data/models/student_model.dart';
import '../../../data/models/user_model.dart';
import '../../../data/services/database_service.dart';
import '../../auth/controllers/auth_controller.dart';

class NoticesController extends GetxController {
  final RxList<NoticeModel> allNotices = <NoticeModel>[].obs;
  final RxList<NoticeModel> filteredNotices = <NoticeModel>[].obs;

  final RxBool isLoading = true.obs;
  final RxString selectedCategory = 'All'.obs;
  final RxString searchQuery = ''.obs;

  int get unreadCount => allNotices.where((n) => !n.isRead).length;

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

    List<NoticeModel> userNotices = [];
    if (user == null || user.role != UserRole.student || user.studentProfileId == null) {
      userNotices = all;
    } else {
      final StudentModel? profile = await isar.studentModels.get(user.studentProfileId!);
      if (profile == null) {
        userNotices = all;
      } else {
        userNotices = all.where((n) {
          final deptMatches = n.departmentFilter == null || n.departmentFilter == profile.department;
          final yearMatches = n.yearFilter == null || n.yearFilter == profile.yearOfStudy;
          return deptMatches && yearMatches;
        }).toList();
      }
    }

    allNotices.value = userNotices;
    _applyFilters();
    isLoading.value = false;
  }

  void setCategory(String category) {
    selectedCategory.value = category;
    _applyFilters();
  }

  void setSearchQuery(String query) {
    searchQuery.value = query;
    _applyFilters();
  }

  void _applyFilters() {
    var result = List<NoticeModel>.from(allNotices);

    if (selectedCategory.value != 'All') {
      result = result.where((n) => (n.category ?? 'General').toLowerCase() == selectedCategory.value.toLowerCase()).toList();
    }

    if (searchQuery.value.isNotEmpty) {
      final q = searchQuery.value.toLowerCase();
      result = result.where((n) => n.title.toLowerCase().contains(q) || n.body.toLowerCase().contains(q)).toList();
    }

    filteredNotices.value = result;
  }

  Future<void> toggleReadStatus(NoticeModel notice) async {
    final isar = DatabaseService.instance;
    await isar.writeTxn(() async {
      notice.isRead = !notice.isRead;
      await isar.noticeModels.put(notice);
    });
    allNotices.refresh();
    _applyFilters();
  }

  Future<void> refreshNotices() => _load();
}
