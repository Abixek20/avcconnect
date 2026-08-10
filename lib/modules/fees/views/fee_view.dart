import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/fee_controller.dart';
import '../../../data/models/fee_model.dart';
import '../../../core/theme/app_theme.dart';

class FeeView extends StatelessWidget {
  const FeeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FeeController());

    return Scaffold(
      appBar: AppBar(title: const Text('Fee & Hostel')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.fees.isEmpty) {
          return const Center(child: Text('No fee records found.'));
        }
        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: controller.fees.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) => _feeCard(controller.fees[index]),
        );
      }),
    );
  }

  Widget _feeCard(FeeModel fee) {
    final color = switch (fee.status) {
      FeeStatus.paid => Colors.green,
      FeeStatus.due => Colors.orange,
      FeeStatus.overdue => Colors.red,
    };
    final label = switch (fee.status) {
      FeeStatus.paid => 'Paid',
      FeeStatus.due => 'Due',
      FeeStatus.overdue => 'Overdue',
    };

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: color.withOpacity(0.12), shape: BoxShape.circle),
              child: Icon(Icons.currency_rupee, color: color),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(fee.term, style: const TextStyle(fontWeight: FontWeight.w600, color: AppTheme.navy)),
                  const SizedBox(height: 4),
                  Text('₹${fee.amount.toStringAsFixed(0)}', style: const TextStyle(fontSize: 13)),
                  Text('Due: ${DateFormat('MMM d, yyyy').format(fee.dueDate)}',
                      style: const TextStyle(fontSize: 11, color: Colors.black45)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(color: color.withOpacity(0.12), borderRadius: BorderRadius.circular(20)),
              child: Text(label, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }
}