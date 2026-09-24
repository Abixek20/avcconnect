import 'package:isar_community/isar.dart';

part 'academic_event_model.g.dart';

enum EventCategory { holiday, exam, fest, academic }

@collection
class AcademicEventModel {
  Id id = Isar.autoIncrement;

  late String title;
  late String description;

  @Index()
  late DateTime eventDate;
  DateTime? endDate;

  @enumerated
  late EventCategory category;

  bool isHoliday = false;
  String? location;
  String? department; // null = all departments
}
