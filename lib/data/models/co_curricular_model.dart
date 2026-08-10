import 'package:isar_community/isar.dart';

part 'co_curricular_model.g.dart';

enum ActivityCategory { sports, ncc, nss, cultural, technical, other }
enum ActivityLevel { college, district, state, national, international }

@collection
class CoCurricularModel {
  Id id = Isar.autoIncrement;

  late int studentProfileId;

  @enumerated
  late ActivityCategory category;
  @enumerated
  late ActivityLevel level;

  late String title;
  String? achievement; // e.g. "1st Place", "Participation"
  late DateTime eventDate;
  String? description;
}