import 'package:isar_community/isar.dart';

part 'notice_model.g.dart';

@collection
class NoticeModel {
  Id id = Isar.autoIncrement;

  late String title;
  late String body;
  late int postedByUserId;

  @Index()
  late DateTime postedAt;

  String? departmentFilter; // null = visible to all departments
  int? yearFilter; // null = visible to all years
}