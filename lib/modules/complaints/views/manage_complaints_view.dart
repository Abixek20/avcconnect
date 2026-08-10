import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_theme.dart';
import '../../../data/models/complaint_model.dart';
import '../complaint_display_helpers.dart';
import '../controllers/manage_complaints_controller.dart';

class ManageComplaintsView extends StatelessWidget {
  const ManageComplaintsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ManageComplaintsController());

    return Scaffold(
      appBar: AppBar(title: const Text('Complaints')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _filterChip(controller, null, 'All'),
                    const SizedBox(width: 8),
                    _filterChip(controller, ComplaintStatus.open, 'Open'),
                    const SizedBox(width: 8),
                    _filterChip(controller, ComplaintStatus.inProgress, 'In Progress'),
                    const SizedBox(width: 8),
                    _filterChip(controller, ComplaintStatus.resolved, 'Resolved'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Obx(() {
                final items = controller.filtered;
                if (items.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Text('No complaints in this category.', textAlign: TextAlign.center),
                    ),
                  );
                }
                return RefreshIndicator(
                  onRefresh: controller.refresh,
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: items.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final item = items[index];
                      final complaint = item.complaint;
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
                                      '${complaintCategoryLabel(complaint.category)} • ${item.raiserName}',
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
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
                              const SizedBox(height: 6),
                              Text(
                                'Raised ${DateFormat('MMM d, yyyy').format(complaint.createdAt)}',
                                style: const TextStyle(fontSize: 11, color: Colors.black45),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  if (complaint.status != ComplaintStatus.inProgress)
                                    TextButton(
                                      onPressed: () => controller.updateStatus(complaint, ComplaintStatus.inProgress),
                                      child: const Text('Mark In Progress'),
                                    ),
                                  if (complaint.status != ComplaintStatus.resolved)
                                    TextButton(
                                      onPressed: () => controller.updateStatus(complaint, ComplaintStatus.resolved),
                                      child: const Text('Mark Resolved'),
                                    ),
                                  if (complaint.status == ComplaintStatus.resolved)
                                    TextButton(
                                      onPressed: () => controller.updateStatus(complaint, ComplaintStatus.open),
                                      child: const Text('Reopen'),
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
            ),
          ],
        );
      }),
    );
  }

  Widget _filterChip(ManageComplaintsController controller, ComplaintStatus? status, String label) {
    return Obx(() {
      final selected = controller.statusFilter.value == status;
      return ChoiceChip(
        label: Text(label, style: const TextStyle(fontSize: 12)),
        selected: selected,
        selectedColor: AppTheme.navy,
        labelStyle: TextStyle(color: selected ? Colors.white : Colors.black87),
        onSelected: (_) => controller.statusFilter.value = status,
      );
    });
  }
}
