import 'package:isar_community/isar.dart';

part 'user_model.g.dart';

enum UserRole {
  student,
  faculty,
  admin,
}

@collection
class UserModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, caseSensitive: false)
  late String email;

  late String password; // demo only - plain text for mock login, never do this in production

  late String name;

  @enumerated
  late UserRole role;

  String? department; // department code, e.g. "CSE", "AIDS", "ECE"
  String? photoUrl;

  // Role-specific extension IDs (nullable - only one will be set)
  int? studentProfileId;
  int? facultyProfileId;
}