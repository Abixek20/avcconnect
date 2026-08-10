import 'package:isar_community/isar.dart';

part 'placement_training_model.g.dart';

@collection
class PlacementTrainingModel {
  Id id = Isar.autoIncrement;

  late int studentProfileId;

  late String title;
  late String provider;
  late bool isInCollege; // true = conducted by AVC, false = external

  late DateTime startDate;
  DateTime? endDate;
  String? description;
}