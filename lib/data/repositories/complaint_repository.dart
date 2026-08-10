import '../models/complaint_model.dart';
import '../services/database_service.dart';
import 'package:isar_community/isar.dart';

class ComplaintRepository {
  Future<List<ComplaintModel>> getForUser(int userId) {
    return DatabaseService.instance.complaintModels
        .filter()
        .raisedByUserIdEqualTo(userId)
        .findAll();
  }

  Future<void> submit(ComplaintModel complaint) async {
    final isar = DatabaseService.instance;
    await isar.writeTxn(() => isar.complaintModels.put(complaint));
  }
}