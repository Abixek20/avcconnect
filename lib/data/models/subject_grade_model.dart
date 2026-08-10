import 'package:isar_community/isar.dart';

part 'subject_grade_model.g.dart';

@collection
class SubjectGradeModel {
  Id id = Isar.autoIncrement;

  late int semesterRecordId;

  late String subjectName;
  late String subjectCode;

  double? ciaMarks; // out of 50, typical internal assessment
  double? semesterExamMarks; // out of 100
  String? grade; // e.g. "A+", "O", "B"
  double? gradePoint; // e.g. 9.0

  bool isArrear = false;
}