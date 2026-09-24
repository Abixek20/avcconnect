import 'package:get/get.dart';

import '../../../data/models/notice_model.dart';
import '../../../data/services/database_service.dart';
import '../../auth/controllers/auth_controller.dart';

class ComposeNoticeController extends GetxController {
  final RxString category = 'General'.obs;
  final RxnString departmentFilter = RxnString();
  final RxnInt yearFilter = RxnInt();
  final RxBool isPosting = false.obs;
  final RxnString errorMessage = RxnString();

  static const categories = ['Academic', 'Exam', 'Event', 'General'];

  static const departments = [
    'AIDS', 'CE', 'CSE', 'EEE', 'ECE', 'IT', 'ICE', 'ME', 'BA', 'CA', 'SH',
  ];

  Future<bool> post({required String title, required String body}) async {
    if (title.trim().isEmpty || body.trim().isEmpty) {
      errorMessage.value = 'Please fill in both title and body';
      return false;
    }

    isPosting.value = true;
    errorMessage.value = null;

    final user = AuthController.to.currentUser.value;
    final isar = DatabaseService.instance;

    final notice = NoticeModel()
      ..title = title.trim()
      ..body = body.trim()
      ..category = category.value
      ..isRead = false
      ..postedByUserId = user?.id ?? 0
      ..postedAt = DateTime.now()
      ..departmentFilter = departmentFilter.value
      ..yearFilter = yearFilter.value;

    await isar.writeTxn(() async {
      await isar.noticeModels.put(notice);
    });

    isPosting.value = false;
    return true;
  }
}
