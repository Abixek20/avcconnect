import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_theme.dart';
import '../../../data/models/class_slot_model.dart';
import '../controllers/faculty_classes_controller.dart';
import 'mark_attendance_view.dart';

class FacultyClassesView extends StatelessWidget {
  const FacultyClassesView({super.key});

  static const _dayLabels = {
    WeekDay.monday: 'Monday',
    WeekDay.tuesday: 'Tuesday',
    WeekDay.wednesday: 'Wednesday',
    WeekDay.thursday: 'Thursday',
    WeekDay.friday: 'Friday',
    WeekDay.saturday: 'Saturday',
  };

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FacultyClassesController());

    return Scaffold(
      appBar: AppBar(title: const Text('Mark Attendance')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!controller.hasFacultyProfile.value) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Text(
                'No faculty profile linked to this account.',
                textAlign: TextAlign.center,
              ),
            ),
          );
        }

        if (controller.weekSlots.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Text(
                'No classes assigned to you yet.',
                textAlign: TextAlign.center,
              ),
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: controller.refresh,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text(
                'Select a class to mark attendance for',
                style: TextStyle(fontSize: 13, color: Colors.black54),
              ),
              const SizedBox(height: 16),
              ..._dayLabels.entries.map((entry) {
                final slots = controller.weekSlots[entry.key] ?? [];
                if (slots.isEmpty) return const SizedBox.shrink();
                return _buildDaySection(context, entry.value, slots, controller);
              }),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildDaySection(
    BuildContext context,
    String dayLabel,
    List<ClassSlotModel> slots,
    FacultyClassesController controller,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(dayLabel, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        const SizedBox(height: 8),
        ...slots.map((slot) => Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(slot.startTime, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                    Text(slot.endTime, style: const TextStyle(fontSize: 10, color: Colors.black45)),
                  ],
                ),
                title: Text(slot.subjectName),
                subtitle: Text('${slot.subjectCode} • ${slot.department} Yr${slot.yearOfStudy} ${slot.section} • ${slot.roomNumber}'),
                trailing: const Icon(Icons.chevron_right, color: AppTheme.teal),
                onTap: () {
                  final faculty = controller.facultyProfile;
                  if (faculty == null) return;
                  Get.to(() => MarkAttendanceView(slot: slot, facultyProfile: faculty));
                },
              ),
            )),
        const SizedBox(height: 16),
      ],
    );
  }
}
