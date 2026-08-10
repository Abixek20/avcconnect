import 'package:get/get.dart';

import '../../../data/models/complaint_model.dart';
import '../../../data/services/database_service.dart';
import '../../auth/controllers/auth_controller.dart';
import 'package:isar_community/isar.dart';

class MyComplaintsController extends GetxController {
  final RxList<ComplaintModel> complaints = <ComplaintModel>[].obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  Future<void> _load() async {
    isLoading.value = true;
    final isar = DatabaseService.instance;
    final userId = AuthController.to.currentUser.value?.id;

    if (userId == null) {
      isLoading.value = false;
      return;
    }

    final all = await isar.complaintModels
        .filter()
        .raisedByUserIdEqualTo(userId)
        .findAll();
    all.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    complaints.value = all;
    isLoading.value = false;
  }

  Future<void> refresh() => _load();
}
