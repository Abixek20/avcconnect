import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_theme.dart';
import '../../../data/models/exam_schedule_model.dart';
import '../../../data/models/semester_record_model.dart';
import '../../../data/models/subject_grade_model.dart';
import '../../auth/controllers/auth_controller.dart';
import '../../shared/widgets/skeleton_loader.dart';
import '../controllers/exams_controller.dart';

class ExamsView extends StatelessWidget {
  const ExamsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ExamsController());

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppTheme.background,
        appBar: AppBar(
          title: const Text('Exams & Results'),
          backgroundColor: AppTheme.navy,
          foregroundColor: Colors.white,
          elevation: 0,
          bottom: const TabBar(
            indicatorColor: AppTheme.teal,
            indicatorWeight: 3,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            tabs: [
              Tab(text: 'Hall Ticket', icon: Icon(Icons.badge_outlined, size: 20)),
              Tab(text: 'Schedule', icon: Icon(Icons.calendar_month_outlined, size: 20)),
              Tab(text: 'Results', icon: Icon(Icons.grade_outlined, size: 20)),
            ],
          ),
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const ListSkeleton(itemCount: 4, cardHeight: 120);
          }

          return TabBarView(
            children: [
              _HallTicketTab(controller: controller),
              _ScheduleTab(controller: controller),
              _ResultsTab(controller: controller),
            ],
          );
        }),
      ),
    );
  }
}

class _HallTicketTab extends StatelessWidget {
  final ExamsController controller;
  const _HallTicketTab({required this.controller});

  @override
  Widget build(BuildContext context) {
    final user = AuthController.to.currentUser.value;
    final student = controller.studentProfile.value;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Digital Hall Ticket Card
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppTheme.navy.withOpacity(0.2), width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.navy.withOpacity(0.08),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header Banner
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppTheme.navy, Color(0xFF1B4278)],
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                    ),
                  ),
                  child: Column(
                    children: const [
                      Text(
                        'A.V.C. COLLEGE OF ENGINEERING',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 0.8),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 2),
                      Text(
                        'OFFICIAL EXAMINATION HALL TICKET',
                        style: TextStyle(color: AppTheme.teal, fontWeight: FontWeight.w800, fontSize: 12, letterSpacing: 1),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Odd Semester Examinations 2026–2027',
                        style: TextStyle(color: Colors.white70, fontSize: 11),
                      ),
                    ],
                  ),
                ),

                // Student Meta Info
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundColor: AppTheme.navy,
                        child: Text(
                          _initials(user?.name ?? 'S'),
                          style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user?.name ?? 'Student Name',
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.navy),
                            ),
                            const SizedBox(height: 4),
                            Text('Roll No: ${student?.rollNumber ?? 'AU24CSE014'}', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                            Text('Dept: ${student?.department ?? 'CSE'} • Year ${student?.yearOfStudy ?? 2} (Sec ${student?.section ?? 'A'})', style: const TextStyle(fontSize: 12, color: Colors.black54)),
                            const Text('Exam Center: Main Block – Hall 102', style: TextStyle(fontSize: 11, color: AppTheme.teal, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),

                // Exam Subject Table Header
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('REGISTERED SUBJECTS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.navy)),
                      Text('SESSION', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.navy)),
                    ],
                  ),
                ),

                // Subject List
                if (controller.schedules.isEmpty)
                  const Padding(
                    padding: EdgeInsets.all(24),
                    child: Center(child: Text('No upcoming exams scheduled for your class.', style: TextStyle(fontSize: 13, color: Colors.black54))),
                  )
                else
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    itemCount: controller.schedules.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (context, idx) {
                      final item = controller.schedules[idx];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppTheme.navy.withOpacity(0.08),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(item.subjectCode, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: AppTheme.navy)),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item.subjectName, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                                  Text(DateFormat('MMM d, yyyy').format(item.examDate), style: const TextStyle(fontSize: 11, color: Colors.black54)),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: item.session == 'FN' ? Colors.blue.shade100 : Colors.amber.shade100,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    item.session,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: item.session == 'FN' ? Colors.blue.shade900 : Colors.amber.shade900,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(item.timeSlot, style: const TextStyle(fontSize: 10, color: Colors.black45)),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                const SizedBox(height: 12),
                // Invigilator Signature area
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('STATUS: VERIFIED', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 11)),
                            Text('Controller of Examinations', style: TextStyle(fontSize: 10, color: Colors.black54)),
                          ],
                        ),
                        Icon(Icons.verified, color: Colors.green, size: 28),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts.first.substring(0, 1).toUpperCase();
    return (parts.first.substring(0, 1) + parts.last.substring(0, 1)).toUpperCase();
  }
}

class _ScheduleTab extends StatelessWidget {
  final ExamsController controller;
  const _ScheduleTab({required this.controller});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: controller.refresh,
      child: controller.schedules.isEmpty
          ? ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: const [
                SizedBox(height: 100),
                Center(
                  child: Text('No exam schedules available.', style: TextStyle(color: Colors.black54)),
                ),
              ],
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: controller.schedules.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final exam = controller.schedules[index];
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
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppTheme.navy,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              exam.subjectCode,
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              exam.subjectName,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppTheme.navy),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              exam.examType,
                              style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(Icons.calendar_today_outlined, size: 14, color: Colors.black54),
                          const SizedBox(width: 6),
                          Text(
                            DateFormat('EEEE, MMMM d, yyyy').format(exam.examDate),
                            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(Icons.access_time_outlined, size: 14, color: Colors.black54),
                          const SizedBox(width: 6),
                          Text(
                            '${exam.session} (${exam.timeSlot})',
                            style: const TextStyle(fontSize: 13, color: Colors.black87),
                          ),
                          const Spacer(),
                          const Icon(Icons.meeting_room_outlined, size: 14, color: Colors.black54),
                          const SizedBox(width: 4),
                          Text(
                            exam.hallNumber,
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppTheme.teal),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}

class _ResultsTab extends StatelessWidget {
  final ExamsController controller;
  const _ResultsTab({required this.controller});

  @override
  Widget build(BuildContext context) {
    if (controller.semesterRecords.isEmpty) {
      return RefreshIndicator(
        onRefresh: controller.refresh,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: const [
            SizedBox(height: 100),
            Center(
              child: Text('No semester results published yet.', style: TextStyle(color: Colors.black54)),
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
        itemCount: controller.semesterRecords.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final sem = controller.semesterRecords[index];
          final grades = controller.subjectGradesMap[sem.id] ?? [];

          return Container(
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
                // Sem Header
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppTheme.navy.withOpacity(0.05),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'SEMESTER ${sem.semesterNumber}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppTheme.navy),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppTheme.teal,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'SGPA: ${sem.sgpa?.toStringAsFixed(2) ?? 'N/A'}',
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),

                // Grade items list
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    children: grades.map((g) {
                      final gradeStr = g.grade ?? 'B';
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(g.subjectName, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                                  Text(g.subjectCode, style: const TextStyle(fontSize: 11, color: Colors.black45)),
                                ],
                              ),
                            ),
                            Text('CIA: ${g.ciaMarks}/50', style: const TextStyle(fontSize: 11, color: Colors.black54)),
                            const SizedBox(width: 12),
                            Container(
                              width: 30,
                              height: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: _gradeColor(gradeStr).withOpacity(0.15),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                gradeStr,
                                style: TextStyle(
                                  color: _gradeColor(gradeStr),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Color _gradeColor(String? grade) {
    if (grade == null) return Colors.blue;
    if (grade.startsWith('O') || grade.startsWith('A')) return Colors.green.shade700;
    if (grade.startsWith('B')) return Colors.blue.shade700;
    if (grade.startsWith('C')) return Colors.amber.shade800;
    return Colors.red;
  }
}
