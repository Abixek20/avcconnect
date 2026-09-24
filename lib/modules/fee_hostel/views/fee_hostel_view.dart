import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_theme.dart';
import '../../../data/models/student_model.dart';
import '../controllers/fee_hostel_controller.dart';

import '../../shared/widgets/skeleton_loader.dart';

class FeeHostelView extends StatelessWidget {
  const FeeHostelView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FeeHostelController());
    final currency = NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 0);

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(title: const Text('Fee & Hostel Dues')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const ListSkeleton(itemCount: 4, cardHeight: 110);
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
              _sectionHeader('Fee Breakdown'),
              const SizedBox(height: 8),
              ...controller.dues.map((due) => _dueCard(due, currency)),
              const SizedBox(height: 12),
              _disclaimerCard(),
            ],
          ),
        );
      }),
    );
  }

  Widget _sectionHeader(String title) => Row(
        children: [
          Container(
            width: 4,
            height: 18,
            decoration: BoxDecoration(
              color: AppTheme.teal,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppTheme.navy),
          ),
        ],
      );

  Widget _hostelCard(StudentModel student) {
    final isHosteller = student.hostelBlock != null;
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppTheme.navy, Color(0xFF1A3A6B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppTheme.navy.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.white.withOpacity(0.15),
            child: Icon(
              isHosteller ? Icons.holiday_village_outlined : Icons.directions_bus_outlined,
              color: Colors.white,
              size: 26,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isHosteller ? 'Hostel Resident' : 'Day Scholar',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  isHosteller
                      ? '${student.hostelBlock} • Room ${student.roomNumber ?? '-'}'
                      : 'Not allotted hostel accommodation',
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _duesSummaryCard(FeeHostelController controller, NumberFormat currency) {
    final due = controller.totalDue;
    final allPaid = due == 0;
    final color = allPaid ? AppTheme.teal : Colors.redAccent;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: color.withOpacity(0.1),
              child: Icon(
                allPaid ? Icons.check_circle_outline : Icons.error_outline,
                color: color,
                size: 24,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    allPaid ? 'All dues cleared' : 'Outstanding dues',
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  ),
                  if (!allPaid) ...[
                    const SizedBox(height: 4),
                    Text(
                      currency.format(due),
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      ),
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
    final color = due.paid ? AppTheme.teal : Colors.redAccent;

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 4,
              height: 40,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    due.label,
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: AppTheme.navy),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    'Due ${DateFormat('MMM d, yyyy').format(due.dueDate)}',
                    style: const TextStyle(fontSize: 11, color: Colors.black45),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  currency.format(due.amount),
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    due.paid ? 'Paid' : 'Pending',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _disclaimerCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.03),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black.withOpacity(0.06)),
      ),
      child: Row(
        children: [
          const Icon(Icons.info_outline, size: 16, color: Colors.black38),
          const SizedBox(width: 8),
          const Expanded(
            child: Text(
              'Demo data — AVConnect is not yet connected to a live payment gateway. These figures illustrate what this screen will show once billing is integrated.',
              style: TextStyle(fontSize: 11, color: Colors.black38),
            ),
          ),
        ],
      ),
    );
  }
}
