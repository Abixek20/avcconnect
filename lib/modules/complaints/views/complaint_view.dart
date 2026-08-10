import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/complaint_controller.dart';
import '../../../data/models/complaint_model.dart';
import '../../../core/theme/app_theme.dart';

class ComplaintView extends StatelessWidget {
  const ComplaintView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ComplaintController());

    return Scaffold(
      appBar: AppBar(title: const Text('Complaints')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showRaiseDialog(context, controller),
        icon: const Icon(Icons.add),
        label: const Text('Raise Complaint'),
        backgroundColor: AppTheme.teal,
      ),
      body: Obx(() {
        if (controller.complaints.isEmpty) {
          return const Center(child: Text('No complaints raised yet.'));
        }
        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: controller.complaints.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) => _complaintCard(controller.complaints[index]),
        );
      }),
    );
  }

  Widget _complaintCard(ComplaintModel c) {
    final statusColor = switch (c.status) {
      ComplaintStatus.open => Colors.orange,
      ComplaintStatus.inProgress => Colors.blue,
      ComplaintStatus.resolved => Colors.green,
    };
    final statusLabel = switch (c.status) {
      ComplaintStatus.open => 'Open',
      ComplaintStatus.inProgress => 'In Progress',
      ComplaintStatus.resolved => 'Resolved',
    };

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(c.category.name.toUpperCase(),
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.navy)),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(color: statusColor.withOpacity(0.12), borderRadius: BorderRadius.circular(20)),
                  child: Text(statusLabel, style: TextStyle(color: statusColor, fontSize: 11, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(c.description, style: const TextStyle(fontSize: 13)),
            const SizedBox(height: 8),
            Text(DateFormat('MMM d, yyyy').format(c.createdAt),
                style: const TextStyle(fontSize: 11, color: Colors.black45)),
          ],
        ),
      ),
    );
  }

  void _showRaiseDialog(BuildContext context, ComplaintController controller) {
    ComplaintCategory selected = ComplaintCategory.academic;
    final descController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Raise a Complaint'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<ComplaintCategory>(
                initialValue: selected,
                items: ComplaintCategory.values
                    .map((c) => DropdownMenuItem(value: c, child: Text(c.name)))
                    .toList(),
                onChanged: (v) => setState(() => selected = v!),
                decoration: const InputDecoration(labelText: 'Category'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: descController,
                maxLines: 4,
                decoration: const InputDecoration(hintText: 'Describe the issue...'),
              ),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Get.back(), child: const Text('Cancel')),
            ElevatedButton(
              onPressed: () {
                if (descController.text.trim().isEmpty) return;
                controller.raiseComplaint(selected, descController.text.trim());
                Get.back();
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}