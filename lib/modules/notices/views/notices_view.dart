import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/notices_controller.dart';
import '../../../core/theme/app_theme.dart';
import '../../shared/widgets/skeleton_loader.dart';

class NoticesView extends StatelessWidget {
  const NoticesView({super.key});

  static const categories = ['All', 'Academic', 'Exam', 'Event', 'General'];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NoticesController());

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Notices & Announcements'),
        elevation: 0,
        backgroundColor: AppTheme.navy,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Header search & category filtering container
          Container(
            color: AppTheme.navy,
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Column(
              children: [
                // Search field
                TextField(
                  onChanged: controller.setSearchQuery,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'Search notices...',
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
                const SizedBox(height: 12),

                // Category chips
                Obx(() {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: categories.map((cat) {
                        final isSelected = controller.selectedCategory.value == cat;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ChoiceChip(
                            label: Text(cat),
                            selected: isSelected,
                            onSelected: (_) => controller.setCategory(cat),
                            selectedColor: AppTheme.teal,
                            backgroundColor: Colors.white.withOpacity(0.12),
                            labelStyle: TextStyle(
                              color: isSelected ? Colors.white : Colors.white70,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              fontSize: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            showCheckmark: false,
                            side: BorderSide.none,
                          ),
                        );
                      }).toList(),
                    ),
                  );
                }),
              ],
            ),
          ),

          // Main Notice List
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const ListSkeleton(itemCount: 5, cardHeight: 110);
              }

              if (controller.filteredNotices.isEmpty) {
                return RefreshIndicator(
                  onRefresh: controller.refreshNotices,
                  child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: const [
                      SizedBox(height: 100),
                      Center(
                        child: Column(
                          children: [
                            Icon(Icons.campaign_outlined, size: 60, color: Colors.black26),
                            SizedBox(height: 12),
                            Text(
                              'No notices found',
                              style: TextStyle(color: Colors.black54, fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }

              return RefreshIndicator(
                onRefresh: controller.refreshNotices,
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: controller.filteredNotices.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final notice = controller.filteredNotices[index];
                    final cat = notice.category ?? 'General';
                    final catColor = _getCategoryColor(cat);

                    return Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => controller.toggleReadStatus(notice),
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: notice.isRead ? Colors.black.withOpacity(0.06) : catColor.withOpacity(0.4),
                              width: notice.isRead ? 1 : 1.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: notice.isRead ? Colors.black.withOpacity(0.02) : catColor.withOpacity(0.08),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  // Category Pill
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: catColor.withOpacity(0.12),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      cat.toUpperCase(),
                                      style: TextStyle(
                                        color: catColor,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ),

                                  // Date & Unread Dot
                                  Row(
                                    children: [
                                      if (!notice.isRead)
                                        Container(
                                          margin: const EdgeInsets.only(right: 6),
                                          width: 8,
                                          height: 8,
                                          decoration: const BoxDecoration(
                                            color: Colors.redAccent,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      Text(
                                        DateFormat('MMM d, yyyy').format(notice.postedAt),
                                        style: const TextStyle(fontSize: 11, color: Colors.black45),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                notice.title,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: notice.isRead ? FontWeight.w600 : FontWeight.bold,
                                  color: AppTheme.navy,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                notice.body,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black87,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Color _getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'academic':
        return const Color(0xFF1E88E5);
      case 'exam':
        return const Color(0xFFE53935);
      case 'event':
        return const Color(0xFF8E24AA);
      case 'general':
      default:
        return const Color(0xFF00897B);
    }
  }
}