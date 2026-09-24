import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_theme.dart';
import '../../../data/models/leave_application_model.dart';
import '../../shared/widgets/skeleton_loader.dart';
import '../controllers/leave_od_controller.dart';

class LeaveApplicationView extends StatelessWidget {
  const LeaveApplicationView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LeaveOdController());

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Leave & On-Duty (OD)'),
        backgroundColor: AppTheme.navy,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showApplySheet(context, controller),
        icon: const Icon(Icons.note_add_outlined),
        label: const Text('Apply Leave / OD'),
        backgroundColor: AppTheme.navy,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const ListSkeleton(itemCount: 4, cardHeight: 110);
        }

        if (controller.applications.isEmpty) {
          return RefreshIndicator(
            onRefresh: controller.refresh,
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: const [
                SizedBox(height: 120),
                Center(
                  child: Column(
                    children: [
                      Icon(Icons.assignment_outlined, size: 60, color: Colors.black26),
                      SizedBox(height: 12),
                      Text(
                        'No leave or OD applications submitted yet.',
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
            itemCount: controller.applications.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final app = controller.applications[index];
              final statusColor = _statusColor(app.status);

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: app.type == LeaveType.onDuty ? Colors.purple.shade100 : Colors.blue.shade100,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            app.type == LeaveType.onDuty ? 'ON-DUTY (OD)' : 'LEAVE',
                            style: TextStyle(
                              color: app.type == LeaveType.onDuty ? Colors.purple.shade900 : Colors.blue.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: statusColor.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            app.status.name.toUpperCase(),
                            style: TextStyle(color: statusColor, fontWeight: FontWeight.bold, fontSize: 11),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.date_range_outlined, size: 16, color: AppTheme.navy),
                        const SizedBox(width: 6),
                        Text(
                          '${DateFormat('MMM d, yyyy').format(app.startDate)} – ${DateFormat('MMM d, yyyy').format(app.endDate)} (${app.totalDays} day${app.totalDays > 1 ? 's' : ''})',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Reason: ${app.reason}',
                      style: const TextStyle(fontSize: 13, color: Colors.black87),
                    ),
                    if (app.remarksByFaculty != null && app.remarksByFaculty!.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Faculty Remark: ${app.remarksByFaculty}',
                          style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: Colors.black87),
                        ),
                      ),
                    ],
                    const SizedBox(height: 8),
                    Text(
                      'Applied ${DateFormat('MMM d, yyyy').format(app.appliedAt)}',
                      style: const TextStyle(fontSize: 11, color: Colors.black45),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      }),
    );
  }

  Color _statusColor(LeaveStatus status) {
    switch (status) {
      case LeaveStatus.approved:
        return Colors.green.shade700;
      case LeaveStatus.rejected:
        return Colors.red.shade700;
      case LeaveStatus.pending:
      default:
        return Colors.amber.shade900;
    }
  }

  void _showApplySheet(BuildContext context, LeaveOdController controller) {
    LeaveType type = LeaveType.leave;
    final reasonCtrl = TextEditingController();
    DateTime startDate = DateTime.now();
    DateTime endDate = DateTime.now();

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, MediaQuery.of(context).viewInsets.bottom + 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Apply for Leave / OD', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.navy)),
                      IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(ctx)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text('Application Type', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Expanded(
                        child: ChoiceChip(
                          label: const Center(child: Text('Leave')),
                          selected: type == LeaveType.leave,
                          selectedColor: AppTheme.navy,
                          labelStyle: TextStyle(color: type == LeaveType.leave ? Colors.white : Colors.black87),
                          onSelected: (_) => setState(() => type = LeaveType.leave),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ChoiceChip(
                          label: const Center(child: Text('On-Duty (OD)')),
                          selected: type == LeaveType.onDuty,
                          selectedColor: AppTheme.teal,
                          labelStyle: TextStyle(color: type == LeaveType.onDuty ? Colors.white : Colors.black87),
                          onSelected: (_) => setState(() => type = LeaveType.onDuty),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          icon: const Icon(Icons.calendar_month, size: 16),
                          label: Text('From: ${DateFormat('MMM d').format(startDate)}'),
                          onPressed: () async {
                            final picked = await showDatePicker(
                              context: context,
                              initialDate: startDate,
                              firstDate: DateTime.now().subtract(const Duration(days: 7)),
                              lastDate: DateTime.now().add(const Duration(days: 90)),
                            );
                            if (picked != null) {
                              setState(() {
                                startDate = picked;
                                if (endDate.isBefore(startDate)) endDate = startDate;
                              });
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: OutlinedButton.icon(
                          icon: const Icon(Icons.calendar_month, size: 16),
                          label: Text('To: ${DateFormat('MMM d').format(endDate)}'),
                          onPressed: () async {
                            final picked = await showDatePicker(
                              context: context,
                              initialDate: endDate,
                              firstDate: startDate,
                              lastDate: DateTime.now().add(const Duration(days: 90)),
                            );
                            if (picked != null) setState(() => endDate = picked);
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  TextField(
                    controller: reasonCtrl,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: 'Reason for Leave/OD',
                      alignLabelWithHint: true,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.navy,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () async {
                        final success = await controller.applyLeave(
                          type: type,
                          reason: reasonCtrl.text,
                          startDate: startDate,
                          endDate: endDate,
                        );
                        if (success && ctx.mounted) {
                          Navigator.pop(ctx);
                          Get.snackbar(
                            'Submitted',
                            'Leave application submitted to advisor for approval.',
                            backgroundColor: AppTheme.teal,
                            colorText: Colors.white,
                          );
                        }
                      },
                      child: const Text('Submit Application'),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
