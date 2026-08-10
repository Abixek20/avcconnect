import 'package:isar_community/isar.dart';

part 'advisor_meeting_log_model.g.dart';

@collection
class AdvisorMeetingLogModel {
  Id id = Isar.autoIncrement;

  late int studentProfileId;
  late int facultyId;

  late DateTime date;
  late String notes;
  bool followUpNeeded = false;
}