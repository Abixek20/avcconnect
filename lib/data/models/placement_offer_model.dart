import 'package:isar_community/isar.dart';

part 'placement_offer_model.g.dart';

enum OfferType { internship, fullTime }
enum OfferStatus { offered, accepted, declined, completed }

@collection
class PlacementOfferModel {
  Id id = Isar.autoIncrement;

  late int studentProfileId;

  late String companyName;
  late String role;

  @enumerated
  late OfferType type;
  @enumerated
  late OfferStatus status;

  late String packageOrStipend; // e.g. "4.5 LPA" or "15,000/month"
  late DateTime offerDate;
}