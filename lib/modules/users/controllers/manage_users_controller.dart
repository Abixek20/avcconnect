import 'package:get/get.dart';

import '../../../data/models/user_model.dart';
import '../../../data/services/database_service.dart';
import 'package:isar_community/isar.dart';

class ManageUsersController extends GetxController {
  final RxList<UserModel> allUsers = <UserModel>[].obs;
  final RxBool isLoading = true.obs;
  final Rx<UserRole?> roleFilter = Rx<UserRole?>(null);
  final RxString searchQuery = ''.obs;

  List<UserModel> get filtered {
    var list = allUsers.toList();
    if (roleFilter.value != null) {
      list = list.where((u) => u.role == roleFilter.value).toList();
    }
    final q = searchQuery.value.trim().toLowerCase();
    if (q.isNotEmpty) {
      list = list.where((u) => u.name.toLowerCase().contains(q) || u.email.toLowerCase().contains(q)).toList();
    }
    list.sort((a, b) => a.name.compareTo(b.name));
    return list;
  }

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  Future<void> _load() async {
    isLoading.value = true;
    final isar = DatabaseService.instance;
    allUsers.value = await isar.userModels.where().findAll();
    isLoading.value = false;
  }

  Future<void> refresh() => _load();
}
