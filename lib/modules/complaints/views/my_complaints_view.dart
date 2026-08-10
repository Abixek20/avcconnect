import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_theme.dart';
import '../complaint_display_helpers.dart';
import '../controllers/my_complaints_controller.dart';
import 'compose_complaint_view.dart';

class MyComplaintsView extends StatelessWidget {
  const MyComplaintsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyComplaintsController());

    return Scaffold(
      appBar: AppBar(title: const Text('Complaints')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final submitted = await Get.to(() => const ComposeComplaintView());
          if (submitted == true) controller.refresh();
        },
        icon: const Icon(Icons.add),
        label: const Text('New Complaint'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.complaints.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Text(
                'You haven\'t raised any complaints yet.',
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
        return RefreshIndicator(
          onRefresh: controller.refresh,
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 90),
            itemCount: controller.complaints.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final complaint = controller.complaints[index];
              final statusColor = complaintStatusColor(complaint.status);
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(14),
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
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: statusColor.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              complaintStatusLabel(complaint.status),
                              style: TextStyle(fontSize: 11, color: statusColor, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(complaint.description, style: const TextStyle(fontSize: 13)),
                      const SizedBox(height: 8),
                      Text(
                        'Raised ${DateFormat('MMM d, yyyy').format(complaint.createdAt)}',
                        style: const TextStyle(fontSize: 11, color: Colors.black45),
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
