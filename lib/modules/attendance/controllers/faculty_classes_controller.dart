import 'package:get/get.dart';
import 'package:isar_community/isar.dart';

import '../../../data/models/class_slot_model.dart';
import '../../../data/models/faculty_model.dart';
import '../../../data/services/database_service.dart';
import '../../auth/controllers/auth_controller.dart';

class FacultyClassesController extends GetxController {
  final RxMap<WeekDay, List<ClassSlotModel>> weekSlots = <WeekDay, List<ClassSlotModel>>{}.obs;
  final RxBool isLoading = true.obs;
  final RxBool hasFacultyProfile = true.obs;

  FacultyModel? facultyProfile;

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  Future<void> _load() async {
    isLoading.value = true;
    final isar = DatabaseService.instance;
    final user = AuthController.to.currentUser.value;

    if (user?.facultyProfileId == null) {
      hasFacultyProfile.value = false;
      isLoading.value = false;
      return;
    }

    facultyProfile = await isar.facultyModels.get(user!.facultyProfileId!);
    if (facultyProfile == null) {
      hasFacultyProfile.value = false;
      isLoading.value = false;
      return;
    }

    final slots = await isar.classSlotModels
        .filter()
        .facultyProfileIdEqualTo(facultyProfile!.id)
        .findAll();

    final grouped = <WeekDay, List<ClassSlotModel>>{};
    for (final slot in slots) {
      grouped.putIfAbsent(slot.day, () => []).add(slot);
    }
    for (final list in grouped.values) {
      list.sort((a, b) => a.startTime.compareTo(b.startTime));
    }
    weekSlots.value = grouped;

    isLoading.value = false;
  }

  Future<void> refresh() => _load();
}
