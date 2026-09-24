import 'package:isar_community/isar.dart';

part 'exam_schedule_model.g.dart';

@collection
class ExamScheduleModel {
  Id id = Isar.autoIncrement;

  late String department; // e.g. "CSE"
  late int yearOfStudy;    // 1-4
  late String semester;    // e.g. "Sem 4"
  late String subjectCode; // e.g. "CS3401"
  late String subjectName; // e.g. "Algorithms"

  @Index()
  late DateTime examDate;

  late String session;     // "FN" (Forenoon) or "AN" (Afternoon)
  late String timeSlot;    // "09:30 AM - 12:30 PM"
  late String hallNumber;  // "Block C - Hall 102"
  late String examType;    // "CIA-I", "CIA-II", "End Semester Theory", "Lab Practical"
}
