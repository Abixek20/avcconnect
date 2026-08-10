import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_theme.dart';
import '../../../data/models/student_model.dart';
import '../controllers/fee_hostel_controller.dart';

class FeeHostelView extends StatelessWidget {
  const FeeHostelView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FeeHostelController());
    final currency = NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 0);

    return Scaffold(
      appBar: AppBar(title: const Text('Fee & Hostel')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final student = controller.student.value;
        if (student == null) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Text('No student profile linked to this account.', textAlign: TextAlign.center),
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: controller.refresh,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _hostelCard(student),
              const SizedBox(height: 16),
              _duesSummaryCard(controller, currency),
              const SizedBox(height: 16),
              const Text('Fee Breakdown', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              const SizedBox(height: 8),
              ...controller.dues.map((due) => _dueCard(due, currency)),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.03),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Demo data - AVConnect isn\'t connected to a live payment gateway yet. '
                  'These figures illustrate what this screen will show once billing is integrated.',
                  style: TextStyle(fontSize: 11, color: Colors.black45),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _hostelCard(StudentModel student) {
    final isHosteller = student.hostelBlock != null;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: AppTheme.teal.withOpacity(0.12),
              child: Icon(
                isHosteller ? Icons.holiday_village_outlined : Icons.directions_bus_outlined,
                color: AppTheme.teal,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isHosteller ? 'Hostel Resident' : 'Day Scholar',
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    isHosteller
                        ? '${student.hostelBlock} • Room ${student.roomNumber ?? '-'}'
                        : 'Not allotted hostel accommodation',
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _duesSummaryCard(FeeHostelController controller, NumberFormat currency) {
    final due = controller.totalDue;
    final allPaid = due == 0;
    return Card(
      color: allPaid ? AppTheme.teal.withOpacity(0.08) : Colors.redAccent.withOpacity(0.06),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              allPaid ? Icons.check_circle_outline : Icons.error_outline,
              color: allPaid ? AppTheme.teal : Colors.redAccent,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    allPaid ? 'All dues cleared' : 'Total outstanding',
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  ),
                  if (!allPaid) ...[
                    const SizedBox(height: 2),
                    Text(
                      currency.format(due),
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.redAccent),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dueCard(FeeDue due, NumberFormat currency) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        title: Text(due.label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
        subtitle: Text(
          'Due ${DateFormat('MMM d, yyyy').format(due.dueDate)}',
          style: const TextStyle(fontSize: 11, color: Colors.black54),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              currency.format(due.amount),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            const SizedBox(height: 2),
            Text(
              due.paid ? 'Paid' : 'Pending',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: due.paid ? AppTheme.teal : Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
