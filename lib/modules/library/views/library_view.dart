import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_theme.dart';
import '../../shared/widgets/skeleton_loader.dart';
import '../controllers/library_controller.dart';

class LibraryView extends StatelessWidget {
  const LibraryView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LibraryController());

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppTheme.background,
        appBar: AppBar(
          title: const Text('Campus Library & Catalog'),
          backgroundColor: AppTheme.navy,
          foregroundColor: Colors.white,
          elevation: 0,
          bottom: const TabBar(
            indicatorColor: AppTheme.teal,
            indicatorWeight: 3,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            tabs: [
              Tab(text: 'Book Catalog', icon: Icon(Icons.search, size: 20)),
              Tab(text: 'Issued to Me', icon: Icon(Icons.bookmark_added_outlined, size: 20)),
            ],
          ),
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const ListSkeleton(itemCount: 4, cardHeight: 100);
          }

          return TabBarView(
            children: [
              _CatalogTab(controller: controller),
              _IssuedTab(controller: controller),
            ],
          );
        }),
      ),
    );
  }
}

class _CatalogTab extends StatelessWidget {
  final LibraryController controller;
  const _CatalogTab({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search header
        Container(
          color: AppTheme.navy,
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
          child: TextField(
            onChanged: controller.setSearchQuery,
            style: const TextStyle(color: Colors.white, fontSize: 14),
            decoration: InputDecoration(
              hintText: 'Search title, author, department, ISBN...',
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
              prefixIcon: const Icon(Icons.search, color: Colors.white70, size: 20),
              filled: true,
              fillColor: Colors.white.withOpacity(0.12),
              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),

        // Catalog List
        Expanded(
          child: Obx(() {
            if (controller.filteredCatalog.isEmpty) {
              return RefreshIndicator(
                onRefresh: controller.refresh,
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: const [
                    SizedBox(height: 100),
                    Center(child: Text('No books matching your search.', style: TextStyle(color: Colors.black54))),
                  ],
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: controller.refresh,
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: controller.filteredCatalog.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final book = controller.filteredCatalog[index];
                  final isAvailable = book.availableCopies > 0;

                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppTheme.navy.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.menu_book_rounded, color: AppTheme.navy, size: 28),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: AppTheme.teal.withOpacity(0.12),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      book.department,
                                      style: const TextStyle(color: AppTheme.teal, fontWeight: FontWeight.bold, fontSize: 10),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: isAvailable ? Colors.green.withOpacity(0.12) : Colors.red.withOpacity(0.12),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      isAvailable ? '${book.availableCopies}/${book.totalCopies} AVAILABLE' : 'OUT OF STOCK',
                                      style: TextStyle(
                                        color: isAvailable ? Colors.green.shade800 : Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text(
                                book.title,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppTheme.navy),
                              ),
                              const SizedBox(height: 2),
                              Text('Author: ${book.author}', style: const TextStyle(fontSize: 13, color: Colors.black87)),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  const Icon(Icons.place_outlined, size: 14, color: Colors.black45),
                                  const SizedBox(width: 4),
                                  Text(book.shelfLocation, style: const TextStyle(fontSize: 11, color: Colors.black54)),
                                  const Spacer(),
                                  Text('ISBN: ${book.isbn}', style: const TextStyle(fontSize: 11, color: Colors.black45)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _IssuedTab extends StatelessWidget {
  final LibraryController controller;
  const _IssuedTab({required this.controller});

  @override
  Widget build(BuildContext context) {
    if (controller.myIssuedBooks.isEmpty) {
      return RefreshIndicator(
        onRefresh: controller.refresh,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: const [
            SizedBox(height: 120),
            Center(
              child: Column(
                children: [
                  Icon(Icons.library_books_outlined, size: 60, color: Colors.black26),
                  SizedBox(height: 12),
                  Text('No books currently issued to you.', style: TextStyle(color: Colors.black54, fontSize: 15)),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: controller.refresh,
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: controller.myIssuedBooks.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = controller.myIssuedBooks[index];
          final isOverdue = DateTime.now().isAfter(item.dueDate);

          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isOverdue ? Colors.red.shade300 : Colors.black.withOpacity(0.06),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.bookTitle,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppTheme.navy),
                    ),
                    if (isOverdue)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: Colors.red.shade100,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          'FINE: ₹${item.fineAmount.toInt()}',
                          style: TextStyle(color: Colors.red.shade900, fontWeight: FontWeight.bold, fontSize: 11),
                        ),
                      )
                    else
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          'ON TIME',
                          style: TextStyle(color: Colors.green.shade900, fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text('Author: ${item.author}', style: const TextStyle(fontSize: 13, color: Colors.black87)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.event, size: 14, color: Colors.black54),
                    const SizedBox(width: 4),
                    Text('Issued: ${DateFormat('MMM d, yyyy').format(item.issuedDate)}', style: const TextStyle(fontSize: 12, color: Colors.black54)),
                    const Spacer(),
                    Icon(Icons.event_busy, size: 14, color: isOverdue ? Colors.red : Colors.black54),
                    const SizedBox(width: 4),
                    Text(
                      'Due: ${DateFormat('MMM d, yyyy').format(item.dueDate)}',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: isOverdue ? Colors.red : Colors.black87),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      controller.renewBook(item);
                      Get.snackbar(
                        'Book Renewed',
                        'Due date extended by 14 days.',
                        backgroundColor: AppTheme.teal,
                        colorText: Colors.white,
                      );
                    },
                    icon: const Icon(Icons.autorenew, size: 16),
                    label: const Text('Renew Book (14 Days)'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
