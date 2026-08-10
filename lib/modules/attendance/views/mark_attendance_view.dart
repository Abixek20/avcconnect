import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_theme.dart';
import '../../../data/models/attendance_model.dart';
import '../../../data/models/class_slot_model.dart';
import '../../../data/models/faculty_model.dart';
import '../controllers/mark_attendance_controller.dart';

class MarkAttendanceView extends StatelessWidget {
  final ClassSlotModel slot;
  final FacultyModel facultyProfile;

  const MarkAttendanceView({
    super.key,
    required this.slot,
    required this.facultyProfile,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      MarkAttendanceController(slot: slot, facultyProfile: facultyProfile),
      tag: '${slot.id}',
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(slot.subjectName),
      ),
      body: Column(
        children: [
          _buildHeaderCard(context, controller),
          const Divider(height: 1),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (controller.roster.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Text(
                      'No students found for this class/section yet.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }
              return ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: controller.roster.length,
                separatorBuilder: (_, __) => const Divider(height: 1, indent: 16, endIndent: 16),
                itemBuilder: (context, index) {
                  final entry = controller.roster[index];
                  return Obx(() {
                    final isPresent = entry.status.value == AttendanceStatus.present;
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: (isPresent ? AppTheme.teal : Colors.redAccent).withOpacity(0.12),
                        child: Text(
                          entry.student.rollNumber.substring(entry.student.rollNumber.length - 2),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: isPresent ? AppTheme.teal : Colors.redAccent,
                          ),
                        ),
                      ),
                      title: Text(entry.student.rollNumber),
                      subtitle: Text('${entry.student.department} • Section ${entry.student.section}'),
                      trailing: FilterChip(
                        label: Text(isPresent ? 'Present' : 'Absent'),
                        selected: isPresent,
                        selectedColor: AppTheme.teal.withOpacity(0.15),
                        checkmarkColor: AppTheme.teal,
                        labelStyle: TextStyle(
                          color: isPresent ? AppTheme.teal : Colors.redAccent,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                        onSelected: (_) => controller.toggle(entry),
                      ),
                      onTap: () => controller.toggle(entry),
                    );
                  });
                },
              );
            }),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: Obx(() => SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: controller.isSaving.value ? null : controller.save,
                  icon: controller.isSaving.value
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                        )
                      : Icon(controller.justSaved.value ? Icons.check : Icons.save_outlined),
                  label: Text(controller.justSaved.value ? 'Saved' : 'Save Attendance'),
                ),
              )),
        ),
      ),
    );
  }

  Widget _buildHeaderCard(BuildContext context, MarkAttendanceController controller) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${slot.subjectCode} • ${slot.department} Yr${slot.yearOfStudy} ${slot.section}',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                ),
                const SizedBox(height: 4),
                Obx(() => Text(
                      _formatDate(controller.selectedDate.value),
                      style: const TextStyle(fontSize: 12, color: Colors.black54),
                    )),
              ],
            ),
          ),
          TextButton.icon(
            onPressed: () => _pickDate(context, controller),
            icon: const Icon(Icons.calendar_today, size: 16),
            label: const Text('Change date'),
          ),
        ],
      ),
    );
  }

  Future<void> _pickDate(BuildContext context, MarkAttendanceController controller) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: controller.selectedDate.value,
      firstDate: DateTime.now().subtract(const Duration(days: 60)),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      await controller.changeDate(picked);
    }
  }

  String _formatDate(DateTime d) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${d.day} ${months[d.month - 1]} ${d.year}';
  }
}
