import 'package:get/get.dart';

import '../../../data/models/student_model.dart';
import '../../../data/services/database_service.dart';
import '../../auth/controllers/auth_controller.dart';

class FeeDue {
  final String label;
  final int amount;
  final DateTime dueDate;
  final bool paid;

  FeeDue({required this.label, required this.amount, required this.dueDate, required this.paid});
}

class FeeHostelController extends GetxController {
  final Rxn<StudentModel> student = Rxn<StudentModel>();
  final RxList<FeeDue> dues = <FeeDue>[].obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  Future<void> _load() async {
    isLoading.value = true;
    final isar = DatabaseService.instance;
    final user = AuthController.to.currentUser.value;

    if (user?.studentProfileId != null) {
      student.value = await isar.studentModels.get(user!.studentProfileId!);
    }

    // NOTE: AVConnect has no live fee/payment gateway integration - there is
    // no FeeModel in the schema. These figures are deterministic demo data
    // derived from the student's own record, illustrating what a real Fee &
    // Hostel module would surface once a payments backend exists.
    final s = student.value;
    if (s != null) {
      final seed = s.id % 3; // vary "paid" status per student for demo variety
      dues.value = [
        FeeDue(
          label: 'Tuition Fee - Odd Semester 2026-27',
          amount: 42500,
          dueDate: DateTime(2026, 9, 15),
          paid: seed != 0,
        ),
        if (s.hostelBlock != null)
          FeeDue(
            label: 'Hostel & Mess Fee - Odd Semester 2026-27',
            amount: 28000,
            dueDate: DateTime(2026, 9, 15),
            paid: seed == 2,
          ),
        FeeDue(
          label: 'Exam Fee - Odd Semester 2026-27',
          amount: 1200,
          dueDate: DateTime(2026, 10, 1),
          paid: seed != 1,
        ),
      ];
    }

    isLoading.value = false;
  }

  int get totalDue => dues.where((d) => !d.paid).fold(0, (sum, d) => sum + d.amount);

  Future<void> refresh() => _load();
}
