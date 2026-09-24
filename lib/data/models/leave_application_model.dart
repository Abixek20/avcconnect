import 'package:isar_community/isar.dart';

part 'leave_application_model.g.dart';

enum LeaveType { leave, onDuty }
enum LeaveStatus { pending, approved, rejected }

@collection
class LeaveApplicationModel {
  Id id = Isar.autoIncrement;

  late int studentProfileId;
  late String studentName;
  late String rollNumber;
  late String department;
  late int yearOfStudy;
  late String section;

  @enumerated
  late LeaveType type;

  late String reason;

  @Index()
  late DateTime startDate;
  late DateTime endDate;
  late int totalDays;

  @enumerated
  late LeaveStatus status;

  late DateTime appliedAt;

  String? remarksByFaculty;
  int? reviewedByUserId;
  DateTime? reviewedAt;
}
