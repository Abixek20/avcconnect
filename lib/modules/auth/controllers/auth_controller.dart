import 'package:get/get.dart';
//import 'package:isar_community/isar.dart';

import '../../../data/models/user_model.dart';
import '../../../data/repositories/user_repository.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  final Rxn<UserModel> currentUser = Rxn<UserModel>();
  final RxBool isLoading = false.obs;
  final RxnString errorMessage = RxnString();

  final UserRepository _userRepo = UserRepository();

  Future<bool> login(String email, String password) async {
    isLoading.value = true;
    errorMessage.value = null;

    final user = await _userRepo.findByEmail(email);

    isLoading.value = false;

    if (user == null || user.password != password) {
      errorMessage.value = 'Invalid email or password';
      return false;
    }

    currentUser.value = user;
    return true;
  }

  void logout() {
    currentUser.value = null;
    Get.offAllNamed('/login');
  }

  String get homeRoute {
    switch (currentUser.value?.role) {
      case UserRole.student:
        return '/student-home';
      case UserRole.faculty:
        return '/faculty-home';
      case UserRole.admin:
        return '/admin-home';
      case null:
        return '/login';
    }
  }
}