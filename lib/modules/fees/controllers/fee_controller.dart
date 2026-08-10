import 'package:get/get.dart';

import '../../../data/models/fee_model.dart';
import '../../../data/repositories/fee_repository.dart';
import '../../auth/controllers/auth_controller.dart';
//import '../../../data/services/database_service.dart';

class FeeController extends GetxController {
  final RxList<FeeModel> fees = <FeeModel>[].obs;
  final RxBool isLoading = true.obs;
  final _repo = FeeRepository();

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  Future<void> _load() async {
    final user = AuthController.to.currentUser.value;
    if (user?.studentProfileId == null) {
      isLoading.value = false;
      return;
    }
    fees.value = await _repo.getForStudent(user!.studentProfileId!);
    isLoading.value = false;
  }
}