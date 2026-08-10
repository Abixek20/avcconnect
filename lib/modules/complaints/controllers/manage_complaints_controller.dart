import 'package:get/get.dart';

import '../../../data/models/complaint_model.dart';
import '../../../data/services/database_service.dart';
import '../../auth/controllers/auth_controller.dart';
import 'package:isar_community/isar.dart';
import '../../../data/models/user_model.dart';

class ComplaintWithRaiser {
  final ComplaintModel complaint;
  final String raiserName;

  ComplaintWithRaiser(this.complaint, this.raiserName);
}

class ManageComplaintsController extends GetxController {
  final RxList<ComplaintWithRaiser> allComplaints = <ComplaintWithRaiser>[].obs;
  final Rx<ComplaintStatus?> statusFilter = Rx<ComplaintStatus?>(null);
  final RxBool isLoading = true.obs;

  List<ComplaintWithRaiser> get filtered {
    if (statusFilter.value == null) return allComplaints;
    return allComplaints.where((c) => c.complaint.status == statusFilter.value).toList();
  }

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  Future<void> _load() async {
    isLoading.value = true;
    final isar = DatabaseService.instance;

    final complaints = await isar.complaintModels.where().findAll();
    complaints.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    final withNames = <ComplaintWithRaiser>[];
    for (final c in complaints) {
      final user = await isar.userModels.get(c.raisedByUserId);
      withNames.add(ComplaintWithRaiser(c, user?.name ?? 'Unknown user'));
    }

    allComplaints.value = withNames;
    isLoading.value = false;
  }

  Future<void> refresh() => _load();

  Future<void> updateStatus(ComplaintModel complaint, ComplaintStatus newStatus) async {
    final isar = DatabaseService.instance;
    final resolverId = AuthController.to.currentUser.value?.id;

    complaint.status = newStatus;
    if (newStatus == ComplaintStatus.resolved) {
      complaint.resolvedByUserId = resolverId;
      complaint.resolvedAt = DateTime.now();
    } else {
      complaint.resolvedByUserId = null;
      complaint.resolvedAt = null;
    }

    await isar.writeTxn(() async {
      await isar.complaintModels.put(complaint);
    });

    final index = allComplaints.indexWhere((c) => c.complaint.id == complaint.id);
    if (index != -1) {
      allComplaints[index] = ComplaintWithRaiser(complaint, allComplaints[index].raiserName);
      allComplaints.refresh();
    }
  }
}
