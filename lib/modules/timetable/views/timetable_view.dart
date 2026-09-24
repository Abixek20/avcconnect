import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/timetable_controller.dart';
import '../../../data/models/class_slot_model.dart';
import '../../../core/theme/app_theme.dart';

// ─── Fixed daily schedule definition ─────────────────────────────────────────

enum _SlotType { period, breakSlot }

class _ScheduleEntry {
  final _SlotType type;
  final String label; // "Period 1", "Morning Break", …
  final String start; // "09:00"
  final String end; // "09:50"
  const _ScheduleEntry({
    required this.type,
    required this.label,
    required this.start,
    required this.end,
  });
}

const _dailySchedule = [
  _ScheduleEntry(type: _SlotType.period,    label: 'Period 1',       start: '09:00', end: '09:50'),
  _ScheduleEntry(type: _SlotType.period,    label: 'Period 2',       start: '09:50', end: '10:40'),
  _ScheduleEntry(type: _SlotType.breakSlot, label: 'Morning Break',  start: '10:40', end: '10:55'),
  _ScheduleEntry(type: _SlotType.period,    label: 'Period 3',       start: '10:55', end: '11:45'),
  _ScheduleEntry(type: _SlotType.period,    label: 'Period 4',       start: '11:45', end: '12:35'),
  _ScheduleEntry(type: _SlotType.breakSlot, label: 'Lunch Break',    start: '12:35', end: '13:20'),
  _ScheduleEntry(type: _SlotType.period,    label: 'Period 5',       start: '13:20', end: '14:10'),
  _ScheduleEntry(type: _SlotType.period,    label: 'Period 6',       start: '14:10', end: '15:00'),
  _ScheduleEntry(type: _SlotType.breakSlot, label: 'Evening Break',  start: '15:00', end: '15:10'),
  _ScheduleEntry(type: _SlotType.period,    label: 'Period 7',       start: '15:10', end: '15:55'),
  _ScheduleEntry(type: _SlotType.period,    label: 'Period 8',       start: '15:55', end: '16:40'),
];

// ─── Main view ────────────────────────────────────────────────────────────────

class TimetableView extends StatelessWidget {
  const TimetableView({super.key});

  static const _days = [
    (WeekDay.monday,    'Monday'),
    (WeekDay.tuesday,   'Tuesday'),
    (WeekDay.wednesday, 'Wednesday'),
    (WeekDay.thursday,  'Thursday'),
    (WeekDay.friday,    'Friday'),
    (WeekDay.saturday,  'Saturday'),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TimetableController());

    // today's index for DefaultTabController (0 = Monday … 5 = Saturday)
    // weekday: Mon=1 … Sat=6, Sun=7
    final todayIndex = () {
      final wd = DateTime.now().weekday; // 1 = Mon
      return wd <= 6 ? wd - 1 : 0;
    }();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppTheme.background,
        appBar: AppBar(
          title: const Text('Timetable & Attendance'),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            tabs: [
              Tab(text: 'Timetable'),
              Tab(text: 'Attendance'),
            ],
          ),
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return RefreshIndicator(
            onRefresh: controller.reloadData,
            child: TabBarView(
              children: [
                _TimetableTab(
                  controller: controller,
                  days: _days,
                  todayIndex: todayIndex,
                ),
                _AttendanceTab(controller: controller),
              ],
            ),
          );
        }),
      ),
    );
  }
}

// ────────────────────────────────────────────────────────────────────────────
// Timetable Tab
// ────────────────────────────────────────────────────────────────────────────

class _TimetableTab extends StatefulWidget {
  final TimetableController controller;
  final List<(WeekDay, String)> days;
  final int todayIndex;

  const _TimetableTab({
    required this.controller,
    required this.days,
    required this.todayIndex,
  });

  @override
  State<_TimetableTab> createState() => _TimetableTabState();
}

class _TimetableTabState extends State<_TimetableTab>
    with SingleTickerProviderStateMixin {
  late TabController _dayTabCtrl;

  @override
  void initState() {
    super.initState();
    _dayTabCtrl = TabController(
      length: widget.days.length,
      vsync: this,
      initialIndex: widget.todayIndex,
    );
  }

  @override
  void dispose() {
    _dayTabCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ── Day selector ────────────────────────────────────
        Container(
          color: AppTheme.navy,
          child: TabBar(
            controller: _dayTabCtrl,
            isScrollable: true,
            indicatorColor: AppTheme.teal,
            indicatorWeight: 3,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white54,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
            tabs: widget.days.map((d) {
              final isToday = widget.days.indexOf(d) == widget.todayIndex;
              return Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isToday) ...[
                      Container(
                        width: 7, height: 7,
                        decoration: const BoxDecoration(
                          color: AppTheme.teal,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 5),
                    ],
                    Text(d.$2.substring(0, 3)), // Mon, Tue …
                  ],
                ),
              );
            }).toList(),
          ),
        ),

        // ── Schedule rows ───────────────────────────────────
        Expanded(
          child: TabBarView(
            controller: _dayTabCtrl,
            children: widget.days.map((d) {
              final daySlots = widget.controller.weekSlots[d.$1] ?? [];
              return _buildDaySchedule(d.$2, daySlots, widget.days.indexOf(d) == widget.todayIndex);
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildDaySchedule(String dayLabel, List<ClassSlotModel> slots, bool isToday) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 24),
      itemCount: _dailySchedule.length + 1, // +1 for header
      itemBuilder: (context, index) {
        if (index == 0) {
          return _dayHeader(dayLabel, isToday);
        }
        final entry = _dailySchedule[index - 1];
        if (entry.type == _SlotType.breakSlot) {
          return _breakRow(entry);
        }
        // Find DB slot matching this time window
        final match = _findSlot(slots, entry.start, entry.end);
        return _periodRow(entry, match, isToday);
      },
    );
  }

  /// Match slot by exact start time ("09:00", "10:55", …)
  ClassSlotModel? _findSlot(List<ClassSlotModel> slots, String start, String end) {
    try {
      return slots.firstWhere((s) => s.startTime == start);
    } catch (_) {
      return null;
    }
  }

  Widget _dayHeader(String label, bool isToday) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isToday
              ? [AppTheme.navy, const Color(0xFF1A4A80)]
              : [Colors.black12, Colors.black12],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            Icons.calendar_today_rounded,
            size: 16,
            color: isToday ? Colors.white : AppTheme.navy,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: isToday ? Colors.white : AppTheme.navy,
            ),
          ),
          if (isToday) ...[
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: AppTheme.teal,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text('TODAY', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 0.8)),
            ),
          ],
        ],
      ),
    );
  }

  Widget _breakRow(_ScheduleEntry entry) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFFFE082), width: 1),
      ),
      child: Row(
        children: [
          const Icon(Icons.coffee_outlined, size: 15, color: Color(0xFFF59E0B)),
          const SizedBox(width: 8),
          Text(
            entry.label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFFB45309),
            ),
          ),
          const Spacer(),
          Text(
            '${_fmt(entry.start)} – ${_fmt(entry.end)}',
            style: const TextStyle(fontSize: 11, color: Color(0xFFB45309)),
          ),
        ],
      ),
    );
  }

  Widget _periodRow(_ScheduleEntry entry, ClassSlotModel? slot, bool isToday) {
    final hasClass = slot != null;
    final now = DateTime.now();
    final currentMinutes = now.hour * 60 + now.minute;
    final startMin = _parseMinutes(entry.start);
    final endMin = _parseMinutes(entry.end);
    final isNow = isToday && currentMinutes >= startMin && currentMinutes < endMin;

    return Container(
      margin: const EdgeInsets.only(bottom: 9),
      decoration: BoxDecoration(
        color: isNow
            ? AppTheme.teal.withOpacity(0.07)
            : Colors.white,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(
          color: isNow
              ? AppTheme.teal
              : hasClass
                  ? Colors.transparent
                  : Colors.grey.withOpacity(0.2),
          width: isNow ? 1.5 : 1,
        ),
        boxShadow: hasClass
            ? [
                BoxShadow(
                  color: AppTheme.navy.withOpacity(0.06),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Time column
            SizedBox(
              width: 54,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _fmt(entry.start),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: isNow ? AppTheme.teal : AppTheme.navy,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Container(width: 1, height: 16, color: Colors.black12),
                  const SizedBox(height: 2),
                  Text(
                    _fmt(entry.end),
                    style: const TextStyle(fontSize: 10, color: Colors.black38),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 2),
            Container(width: 1.5, height: 52, color: Colors.black12),
            const SizedBox(width: 12),
            // Content column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppTheme.navy.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          entry.label,
                          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.navy),
                        ),
                      ),
                      if (isNow) ...[
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppTheme.teal,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text('NOW', style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 0.5)),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 5),
                  if (hasClass) ...[
                    Text(
                      slot.subjectName,
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppTheme.navy),
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppTheme.teal.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            slot.subjectCode,
                            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: AppTheme.teal),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.room_outlined, size: 12, color: Colors.black38),
                        const SizedBox(width: 3),
                        Flexible(
                          child: Text(
                            slot.roomNumber,
                            style: const TextStyle(fontSize: 11, color: Colors.black54),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ] else ...[
                    const Text(
                      'Free Period',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black38, fontStyle: FontStyle.italic),
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

  int _parseMinutes(String hm) {
    final p = hm.split(':');
    return int.parse(p[0]) * 60 + int.parse(p[1]);
  }

  String _fmt(String hm) {
    final p = hm.split(':');
    final h = int.parse(p[0]);
    final m = p[1];
    final ampm = h < 12 ? 'AM' : 'PM';
    final h12 = h == 0 ? 12 : h > 12 ? h - 12 : h;
    return '$h12:$m $ampm';
  }
}

// ────────────────────────────────────────────────────────────────────────────
// Attendance Tab
// ────────────────────────────────────────────────────────────────────────────

class _AttendanceTab extends StatelessWidget {
  final TimetableController controller;

  const _AttendanceTab({required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _overallCard(),
        const SizedBox(height: 16),
        if (controller.subjectStats.isEmpty)
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 40),
              child: Text(
                'No attendance records yet.\nAttendance will appear here once it is marked.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: Colors.black45),
              ),
            ),
          )
        else ...[
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                SizedBox(
                  width: 4,
                  height: 16,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppTheme.teal,
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  'Subject-wise Breakdown',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppTheme.navy),
                ),
              ],
            ),
          ),
          ...controller.subjectStats.map(_subjectCard),
        ],
      ],
    );
  }

  Widget _overallCard() {
    final percent = controller.attendancePercent.value;
    final isLow = percent < 75 && percent > 0;
    final color = percent == 0 ? Colors.black38 : isLow ? Colors.redAccent : AppTheme.teal;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withOpacity(0.9),
            color.withOpacity(0.6),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Overall Attendance',
                  style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 6),
                Text(
                  '${percent.toStringAsFixed(1)}%',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  percent == 0
                      ? 'No attendance marked yet'
                      : isLow
                          ? '⚠ Below 75% — at risk of shortage'
                          : '✓ Good standing',
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 70,
            height: 70,
            child: CircularProgressIndicator(
              value: percent / 100,
              strokeWidth: 7,
              backgroundColor: Colors.white24,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _subjectCard(SubjectAttendanceSummary s) {
    final isLow = s.percent < 75 && s.total > 0;
    final color = s.total == 0 ? Colors.black38 : isLow ? Colors.redAccent : AppTheme.teal;

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        s.slot.subjectName,
                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: AppTheme.navy),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        s.slot.subjectCode,
                        style: const TextStyle(fontSize: 11, color: Colors.black45),
                      ),
                    ],
                  ),
                ),
                Text(
                  '${s.percent.toStringAsFixed(1)}%',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: s.total == 0 ? 0 : s.present / s.total,
                minHeight: 6,
                backgroundColor: color.withOpacity(0.12),
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _statBadge('Present', s.present, AppTheme.teal),
                const SizedBox(width: 8),
                _statBadge('Absent', s.absent, Colors.redAccent),
                const SizedBox(width: 8),
                _statBadge('Total', s.total, Colors.black45),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _statBadge(String label, int value, Color color) => Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 4),
          Text(
            '$label: $value',
            style: TextStyle(fontSize: 11, color: color, fontWeight: FontWeight.w600),
          ),
        ],
      );
}