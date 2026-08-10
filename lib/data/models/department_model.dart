import 'package:isar_community/isar.dart';

part 'department_model.g.dart';

@collection
class DepartmentModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String code; // e.g. "CSE", "AIDS", "ECE"

  late String fullName; // e.g. "Computer Science and Engineering"
}