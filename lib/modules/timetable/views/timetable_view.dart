import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/timetable_controller.dart';
import '../../../data/models/class_slot_model.dart';
import '../../../core/theme/app_theme.dart';

class TimetableView extends StatelessWidget {
  const TimetableView({super.key});

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
    final controller = Get.put(TimetableController());

    return Scaffold(
      appBar: AppBar(title: const Text('Timetable & Attendance')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.weekSlots.isEmpty) {
          return const Center(child: Text('No timetable found for your class yet.'));
        }

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildAttendanceCard(controller),
            const SizedBox(height: 20),
            ..._dayLabels.entries.map((entry) {
              final slots = controller.weekSlots[entry.key] ?? [];
              if (slots.isEmpty) return const SizedBox.shrink();
              return _buildDaySection(entry.value, slots);
            }),
          ],
        );
      }),
    );
  }

  Widget _buildAttendanceCard(TimetableController controller) {
    final percent = controller.attendancePercent.value;
    final isLow = percent < 75 && percent > 0;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: (isLow ? Colors.redAccent : AppTheme.teal).withOpacity(0.12),
              child: Text(
                '${percent.toStringAsFixed(0)}%',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isLow ? Colors.redAccent : AppTheme.teal,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Overall Attendance', style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 4),
                  Text(
                    percent == 0
                        ? 'No attendance marked yet'
                        : isLow
                            ? 'Below 75% - at risk'
                            : 'Good standing',
                    style: TextStyle(fontSize: 12, color: isLow ? Colors.redAccent : Colors.black54),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDaySection(String dayLabel, List<ClassSlotModel> slots) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(dayLabel, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        const SizedBox(height: 8),
        ...slots.map((slot) => Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(slot.startTime, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                    Text(slot.endTime, style: const TextStyle(fontSize: 10, color: Colors.black45)),
                  ],
                ),
                title: Text(slot.subjectName),
                subtitle: Text('${slot.subjectCode} • ${slot.roomNumber}'),
              ),
            )),
        const SizedBox(height: 16),
      ],
    );
  }
}