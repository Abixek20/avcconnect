import 'package:isar_community/isar.dart';

part 'semester_record_model.g.dart';

@collection
class SemesterRecordModel {
  Id id = Isar.autoIncrement;

  late int studentProfileId;
  late int semesterNumber; // 1-8

  double? sgpa;
  double? attendancePercent;
  int arrearCount = 0;
}