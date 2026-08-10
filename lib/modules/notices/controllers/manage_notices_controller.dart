import 'package:get/get.dart';

import '../../../data/models/notice_model.dart';
import '../../../data/services/database_service.dart';
import 'package:isar_community/isar.dart';

class ManageNoticesController extends GetxController {
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
    notices.value = await isar.noticeModels.where().sortByPostedAtDesc().findAll();
    isLoading.value = false;
  }

  Future<void> refresh() => _load();

  Future<void> delete(NoticeModel notice) async {
    final isar = DatabaseService.instance;
    await isar.writeTxn(() async {
      await isar.noticeModels.delete(notice.id);
    });
    notices.removeWhere((n) => n.id == notice.id);
  }
}
