import 'package:isar_community/isar.dart';

part 'fee_model.g.dart';

enum FeeStatus { paid, due, overdue }

@collection
class FeeModel {
  Id id = Isar.autoIncrement;

  late int studentProfileId;
  late String term; // e.g. "Semester 5"
  late double amount;
  late DateTime dueDate;

  @enumerated
  late FeeStatus status;
}