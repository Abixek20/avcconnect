import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_theme.dart';
import '../../../data/models/leave_application_model.dart';
import '../../shared/widgets/skeleton_loader.dart';
import '../controllers/leave_od_controller.dart';

class FacultyLeaveApprovalView extends StatelessWidget {
  const FacultyLeaveApprovalView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LeaveOdController());

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Student Leave Approvals'),
        backgroundColor: AppTheme.navy,
        foregroundColor: Colors.white,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const ListSkeleton(itemCount: 4, cardHeight: 120);
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
                      Icon(Icons.check_circle_outline, size: 60, color: Colors.black26),
                      SizedBox(height: 12),
                      Text(
                        'No pending or historical leave applications.',
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
            padding: const EdgeInsets.all(16),
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              app.studentName,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppTheme.navy),
                            ),
                            Text(
                              '${app.rollNumber} • ${app.department} Yr ${app.yearOfStudy}',
                              style: const TextStyle(fontSize: 12, color: Colors.black54),
                            ),
                          ],
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
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: app.type == LeaveType.onDuty ? Colors.purple.shade100 : Colors.blue.shade100,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            app.type == LeaveType.onDuty ? 'OD' : 'LEAVE',
                            style: TextStyle(
                              color: app.type == LeaveType.onDuty ? Colors.purple.shade900 : Colors.blue.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${DateFormat('MMM d').format(app.startDate)} - ${DateFormat('MMM d, yyyy').format(app.endDate)} (${app.totalDays} day${app.totalDays > 1 ? 's' : ''})',
                          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text('Reason: ${app.reason}', style: const TextStyle(fontSize: 13, color: Colors.black87)),
                    if (app.remarksByFaculty != null && app.remarksByFaculty!.isNotEmpty) ...[
                      const SizedBox(height: 6),
                      Text('Faculty Remark: ${app.remarksByFaculty}', style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: Colors.black54)),
                    ],
                    const SizedBox(height: 12),

                    // Action buttons for pending applications
                    if (app.status == LeaveStatus.pending) ...[
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () => _reviewDialog(context, controller, app, LeaveStatus.rejected),
                              icon: const Icon(Icons.close, color: Colors.red, size: 16),
                              label: const Text('Reject', style: TextStyle(color: Colors.red)),
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Colors.red),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () => _reviewDialog(context, controller, app, LeaveStatus.approved),
                              icon: const Icon(Icons.check, size: 16),
                              label: const Text('Approve'),
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade700),
                            ),
                          ),
                        ],
                      ),
                    ],
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

  void _reviewDialog(BuildContext context, LeaveOdController controller, LeaveApplicationModel app, LeaveStatus status) {
    final remarkCtrl = TextEditingController();

    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('${status == LeaveStatus.approved ? 'Approve' : 'Reject'} Application'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Student: ${app.studentName} (${app.rollNumber})'),
            const SizedBox(height: 10),
            TextField(
              controller: remarkCtrl,
              decoration: const InputDecoration(
                labelText: 'Faculty Remarks (Optional)',
                hintText: 'e.g. Granted OD for fest participation',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: status == LeaveStatus.approved ? Colors.green.shade700 : Colors.red,
            ),
            onPressed: () {
              Navigator.pop(ctx);
              controller.reviewApplication(
                app: app,
                newStatus: status,
                remarks: remarkCtrl.text,
              );
              Get.snackbar(
                'Status Updated',
                'Application has been ${status.name}.',
                backgroundColor: status == LeaveStatus.approved ? Colors.green : Colors.red,
                colorText: Colors.white,
              );
            },
            child: Text(status == LeaveStatus.approved ? 'Approve' : 'Reject'),
          ),
        ],
      ),
    );
  }
}
