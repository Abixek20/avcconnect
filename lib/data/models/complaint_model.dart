import 'package:isar_community/isar.dart';

part 'complaint_model.g.dart';

enum ComplaintCategory { academic, hostel, canteen, infrastructure, other }

enum ComplaintStatus { open, inProgress, resolved }

@collection
class ComplaintModel {
  Id id = Isar.autoIncrement;

  late int raisedByUserId;

  @enumerated
  late ComplaintCategory category;

  late String description;
  String? photoPath;

  @enumerated
  late ComplaintStatus status;

  late DateTime createdAt;
  int? resolvedByUserId;
  DateTime? resolvedAt;
}