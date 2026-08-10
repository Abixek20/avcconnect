import 'package:isar_community/isar.dart';

part 'attendance_model.g.dart';

enum AttendanceStatus { present, absent }

@collection
class AttendanceModel {
  Id id = Isar.autoIncrement;

  late int studentProfileId; // links to StudentModel.id
  late int classSlotId; // links to ClassSlotModel.id

  @Index()
  late DateTime date; // date the class was held (time truncated to midnight)

  @enumerated
  late AttendanceStatus status;

  late int markedByFacultyId; // FacultyModel.id who marked it
}