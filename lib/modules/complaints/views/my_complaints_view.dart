import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_theme.dart';
import '../../shared/widgets/skeleton_loader.dart';
import '../complaint_display_helpers.dart';
import '../controllers/my_complaints_controller.dart';
import 'compose_complaint_view.dart';

class MyComplaintsView extends StatelessWidget {
  const MyComplaintsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyComplaintsController());

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(title: const Text('My Complaints & Grievances')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final submitted = await Get.to(() => const ComposeComplaintView());
          if (submitted == true) controller.refresh();
        },
        icon: const Icon(Icons.add_comment_outlined),
        label: const Text('New Complaint'),
        backgroundColor: AppTheme.navy,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const ListSkeleton(itemCount: 4, cardHeight: 110);
        }
        if (controller.complaints.isEmpty) {
          return RefreshIndicator(
            onRefresh: controller.refresh,
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: const [
                SizedBox(height: 120),
                Center(
                  child: Column(
                    children: [
                      Icon(Icons.check_circle_outline, size: 64, color: Colors.black26),
                      SizedBox(height: 12),
                      Text(
                        'You haven\'t raised any complaints yet.',
                        style: TextStyle(color: Colors.black54, fontSize: 15),
                      ),
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
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 90),
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: controller.complaints.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final complaint = controller.complaints[index];
              final statusColor = complaintStatusColor(complaint.status);
              return Container(
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
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(complaintCategoryIcon(complaint.category), size: 18, color: AppTheme.navy),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              complaintCategoryLabel(complaint.category),
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: statusColor.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              complaintStatusLabel(complaint.status),
                              style: TextStyle(fontSize: 11, color: statusColor, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        complaint.description,
                        style: const TextStyle(fontSize: 14, color: Colors.black87, height: 1.4),
                      ),
                      if (complaint.photoPath != null && File(complaint.photoPath!).existsSync()) ...[
                        const SizedBox(height: 12),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            File(complaint.photoPath!),
                            height: 160,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Raised ${DateFormat('MMM d, yyyy • hh:mm a').format(complaint.createdAt)}',
                            style: const TextStyle(fontSize: 11, color: Colors.black45),
                          ),
                          if (complaint.photoPath != null)
                            Row(
                              children: const [
                                Icon(Icons.attach_file, size: 12, color: Colors.black45),
                                SizedBox(width: 2),
                                Text('1 photo attached', style: TextStyle(fontSize: 11, color: Colors.black45)),
                              ],
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
