import 'package:isar_community/isar.dart';

part 'parent_guardian_model.g.dart';

enum GuardianRelation { father, mother, guardian }

@collection
class ParentGuardianModel {
  Id id = Isar.autoIncrement;

  late int studentProfileId;

  @enumerated
  late GuardianRelation relation;

  late String name;
  String? occupation;
  late String phone;
  String? photoPath; // local asset/file path - see note below
}