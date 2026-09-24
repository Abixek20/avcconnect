import 'package:isar_community/isar.dart';

part 'book_model.g.dart';

@collection
class BookModel {
  Id id = Isar.autoIncrement;

  late String isbn;
  late String title;
  late String author;
  late String department; // e.g. "CSE", "General", "ECE"
  late String category;   // e.g. "Textbook", "Reference", "Journal"
  late int totalCopies;
  late int availableCopies;
  late String shelfLocation; // e.g. "Rack B - Shelf 3"
}
