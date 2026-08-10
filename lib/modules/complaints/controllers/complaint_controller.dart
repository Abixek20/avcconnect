import 'package:get/get.dart';

import '../../../data/models/complaint_model.dart';
import '../../../data/repositories/complaint_repository.dart';
import '../../auth/controllers/auth_controller.dart';

class ComplaintController extends GetxController {
  final RxList<ComplaintModel> complaints = <ComplaintModel>[].obs;
  final _repo = ComplaintRepository();

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  Future<void> _load() async {
    final userId = AuthController.to.currentUser.value?.id;
    if (userId == null) return;
    complaints.value = await _repo.getForUser(userId);
  }

  Future<void> raiseComplaint(ComplaintCategory category, String description) async {
    final userId = AuthController.to.currentUser.value?.id;
    if (userId == null) return;

    final complaint = ComplaintModel()
      ..raisedByUserId = userId
      ..category = category
      ..description = description
      ..status = ComplaintStatus.open
      ..createdAt = DateTime.now();

    await _repo.submit(complaint);
    await _load();
  }
}