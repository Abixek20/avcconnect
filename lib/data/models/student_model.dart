import 'package:isar_community/isar.dart';

part 'student_model.g.dart';

@collection
class StudentModel {
  Id id = Isar.autoIncrement;

  late int userId; // links back to UserModel.id

  @Index()
  late String rollNumber; // e.g. "AU21CSE045"

  late String department; // e.g. "CSE"
  late int yearOfStudy; // 1-4
  late String section; // e.g. "A"

  String? hostelBlock; // null if day scholar, e.g. "Men's Hostel - Block A"
  String? roomNumber;
}