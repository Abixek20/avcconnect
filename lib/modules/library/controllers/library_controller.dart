import 'package:get/get.dart';
import 'package:isar_community/isar.dart';

import '../../../data/models/book_model.dart';
import '../../../data/models/issued_book_model.dart';
import '../../../data/services/database_service.dart';
import '../../auth/controllers/auth_controller.dart';

class LibraryController extends GetxController {
  final RxList<BookModel> catalog = <BookModel>[].obs;
  final RxList<BookModel> filteredCatalog = <BookModel>[].obs;
  final RxList<IssuedBookModel> myIssuedBooks = <IssuedBookModel>[].obs;

  final RxBool isLoading = true.obs;
  final RxString searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  Future<void> _load() async {
    isLoading.value = true;
    final isar = DatabaseService.instance;
    final books = await isar.bookModels.where().sortByTitle().findAll();
    catalog.value = books;
    _applyFilter();

    final user = AuthController.to.currentUser.value;
    if (user != null && user.studentProfileId != null) {
      final issued = await isar.issuedBookModels
          .filter()
          .studentProfileIdEqualTo(user.studentProfileId!)
          .and()
          .isReturnedEqualTo(false)
          .sortByDueDate()
          .findAll();
      
      // Calculate dynamic overdue fine
      final now = DateTime.now();
      for (final book in issued) {
        if (now.isAfter(book.dueDate)) {
          final overdueDays = now.difference(book.dueDate).inDays;
          book.fineAmount = (overdueDays * 5).toDouble(); // ₹5 per day
        } else {
          book.fineAmount = 0.0;
        }
      }
      myIssuedBooks.value = issued;
    }

    isLoading.value = false;
  }

  void setSearchQuery(String query) {
    searchQuery.value = query;
    _applyFilter();
  }

  void _applyFilter() {
    if (searchQuery.value.isEmpty) {
      filteredCatalog.value = catalog;
    } else {
      final q = searchQuery.value.toLowerCase();
      filteredCatalog.value = catalog.where((b) {
        return b.title.toLowerCase().contains(q) ||
            b.author.toLowerCase().contains(q) ||
            b.department.toLowerCase().contains(q) ||
            b.isbn.toLowerCase().contains(q);
      }).toList();
    }
  }

  Future<void> renewBook(IssuedBookModel item) async {
    final isar = DatabaseService.instance;
    await isar.writeTxn(() async {
      item.dueDate = item.dueDate.add(const Duration(days: 14));
      await isar.issuedBookModels.put(item);
    });
    _load();
  }

  Future<void> refresh() => _load();
}
