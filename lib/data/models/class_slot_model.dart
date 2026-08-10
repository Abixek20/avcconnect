import 'package:isar_community/isar.dart';

part 'class_slot_model.g.dart';

enum WeekDay { monday, tuesday, wednesday, thursday, friday, saturday }

@collection
class ClassSlotModel {
  Id id = Isar.autoIncrement;

  @enumerated
  late WeekDay day;

  late String startTime; // "09:00" - stored as string for simple demo display
  late String endTime; // "09:50"

  late String subjectName; // e.g. "Data Structures"
  late String subjectCode; // e.g. "CS8391"

  late String department; // e.g. "CSE"
  late int yearOfStudy; // 1-4
  late String section; // e.g. "A"

  late int facultyProfileId; // links to FacultyModel.id
  late String roomNumber; // e.g. "Block C - 204"
}