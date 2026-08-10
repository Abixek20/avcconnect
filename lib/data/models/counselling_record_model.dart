import 'package:isar_community/isar.dart';

part 'counselling_record_model.g.dart';

enum TransportMode { collegeBus, hosteller, ownTransport, other }

@collection
class CounsellingRecordModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late int studentProfileId;

  late int facultyAdvisorId; // FacultyModel.id

  String? bloodGroup;
  String? aadhaarNumber;
  String? category; // reservation category, nullable

  late String permanentAddress;
  String? currentAddress; // null if same as permanent

  late String emergencyContactName;
  late String emergencyContactPhone;
  String? medicalConditions;

  @enumerated
  late TransportMode transportMode;
  String? busRouteNumber;

  double? tenthPercentage;
  double? twelfthPercentage;

  String? scholarshipDetails;
  String? siblingDetails;
  String? resumeLink;
  String? higherStudiesPlan;
}