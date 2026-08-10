import 'package:isar_community/isar.dart';

import '../models/user_model.dart';
import '../services/database_service.dart';

/// Abstracts user data access. Swap the body of these methods for HTTP
/// calls later (e.g. dio/http package) without touching AuthController.
class UserRepository {
  Future<UserModel?> findByEmail(String email) {
    final isar = DatabaseService.instance;
    return isar.userModels
        .filter()
        .emailEqualTo(email.trim(), caseSensitive: false)
        .findFirst();
  }

  Future<UserModel?> getById(int id) {
    return DatabaseService.instance.userModels.get(id);
  }
}