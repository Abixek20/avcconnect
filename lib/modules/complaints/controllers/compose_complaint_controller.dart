import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/models/complaint_model.dart';
import '../../../data/services/database_service.dart';
import '../../auth/controllers/auth_controller.dart';

class ComposeComplaintController extends GetxController {
  final Rx<ComplaintCategory> category = ComplaintCategory.academic.obs;
  final RxnString photoPath = RxnString();
  final RxBool isSubmitting = false.obs;
  final RxnString errorMessage = RxnString();

  final _picker = ImagePicker();

  Future<void> pickPhoto() async {
    try {
      final XFile? file = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 80,
      );
      if (file != null) {
        photoPath.value = file.path;
      }
    } catch (e) {
      errorMessage.value = 'Failed to pick photo: $e';
    }
  }

  void removePhoto() {
    photoPath.value = null;
  }

  Future<bool> submit(String description) async {
    if (description.trim().isEmpty) {
      errorMessage.value = 'Please describe the issue';
      return false;
    }

    isSubmitting.value = true;
    errorMessage.value = null;

    final user = AuthController.to.currentUser.value;
    final isar = DatabaseService.instance;

    final complaint = ComplaintModel()
      ..raisedByUserId = user?.id ?? 0
      ..category = category.value
      ..description = description.trim()
      ..photoPath = photoPath.value
      ..status = ComplaintStatus.open
      ..createdAt = DateTime.now();

    await isar.writeTxn(() async {
      await isar.complaintModels.put(complaint);
    });

    isSubmitting.value = false;
    return true;
  }
}
