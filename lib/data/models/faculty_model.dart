import 'package:isar_community/isar.dart';

part 'faculty_model.g.dart';

@collection
class FacultyModel {
  Id id = Isar.autoIncrement;

  late int userId; // links back to UserModel.id

  late String department;
  late String designation; // e.g. "Assistant Professor", "HOD"
  List<String> subjectsTaught = [];
}