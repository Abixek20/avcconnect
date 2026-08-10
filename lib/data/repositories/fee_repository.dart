import '../models/fee_model.dart';
import '../services/database_service.dart';
import 'package:isar_community/isar.dart';

class FeeRepository {
  Future<List<FeeModel>> getForStudent(int studentProfileId) {
    return DatabaseService.instance.feeModels
        .filter()
        .studentProfileIdEqualTo(studentProfileId)
        .findAll();
  }
}