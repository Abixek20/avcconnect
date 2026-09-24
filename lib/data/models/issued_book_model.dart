import 'package:isar_community/isar.dart';

part 'issued_book_model.g.dart';

@collection
class IssuedBookModel {
  Id id = Isar.autoIncrement;

  late int bookId;
  late int studentProfileId;

  late String bookTitle;
  late String author;
  late String isbn;

  @Index()
  late DateTime issuedDate;

  @Index()
  late DateTime dueDate;

  DateTime? returnDate;
  late double fineAmount;
  bool isReturned = false;
}
