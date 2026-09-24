import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../academic_calendar/views/academic_calendar_view.dart';
import '../../auth/controllers/auth_controller.dart';
import '../../complaints/views/my_complaints_view.dart';
import '../../counselling/views/counselling_record_view.dart';
import '../../digital_id/views/digital_id_view.dart';
import '../../exams/views/exams_view.dart';
import '../../fee_hostel/views/fee_hostel_view.dart';
import '../../leave_od/views/leave_application_view.dart';
import '../../library/views/library_view.dart';
import '../../notices/controllers/notices_controller.dart';
import '../../notices/views/notices_view.dart';
import '../../timetable/views/timetable_view.dart';
import '../../../core/theme/app_theme.dart';

class StudentHomeView extends StatelessWidget {
  const StudentHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthController.to;
    final noticesCtrl = Get.put(NoticesController());

    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Obx(() {
        final user = auth.currentUser.value;
        final unreadCount = noticesCtrl.unreadCount;

        return CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 190,
              pinned: true,
              backgroundColor: AppTheme.navy,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF071B36), AppTheme.navy, Color(0xFF1B4278)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () => Get.to(() => const DigitalIdView()),
                                    child: CircleAvatar(
                                      radius: 24,
                                      backgroundColor: Colors.white.withOpacity(0.2),
                                      backgroundImage: (user?.photoUrl != null && File(user!.photoUrl!).existsSync())
                                          ? FileImage(File(user!.photoUrl!)) as ImageProvider
                                          : null,
                                      child: (user?.photoUrl == null || !File(user!.photoUrl!).existsSync())
                                          ? Text(
                                              _initials(user?.name ?? 'S'),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          : null,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Hello, ${user?.name.split(' ').first ?? 'Student'} 👋',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Text(
                                        'A.V.C. College of Engineering',
                                        style: TextStyle(color: Colors.white60, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              IconButton(
                                icon: const Icon(Icons.logout, color: Colors.white70),
                                tooltip: 'Logout',
                                onPressed: () => _confirmLogout(context, auth),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.school_outlined, size: 14, color: Colors.white70),
                                    SizedBox(width: 6),
                                    Text(
                                      'Student Portal',
                                      style: TextStyle(color: Colors.white70, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              InkWell(
                                onTap: () => Get.to(() => const DigitalIdView()),
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: AppTheme.teal.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: AppTheme.teal.withOpacity(0.5)),
                                  ),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.badge, size: 14, color: Colors.white),
                                      SizedBox(width: 6),
                                      Text(
                                        'Digital ID',
                                        style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 1.25,
                ),
                delegate: SliverChildListDelegate([
                  _DashTile(
                    icon: Icons.calendar_month_outlined,
                    label: 'Timetable &\nAttendance',
                    gradient: const [Color(0xFF0B2545), Color(0xFF1A3A6B)],
                    onTap: () => Get.to(() => const TimetableView()),
                  ),
                  _DashTile(
                    icon: Icons.campaign_outlined,
                    label: 'Notices',
                    badgeCount: unreadCount,
                    gradient: const [Color(0xFF13A89E), Color(0xFF0D7A71)],
                    onTap: () => Get.to(() => const NoticesView()),
                  ),
                  _DashTile(
                    icon: Icons.badge_outlined,
                    label: 'Digital ID Card',
                    gradient: const [Color(0xFF0D47A1), Color(0xFF1976D2)],
                    onTap: () => Get.to(() => const DigitalIdView()),
                  ),
                  _DashTile(
                    icon: Icons.event_available_outlined,
                    label: 'Academic\nCalendar',
                    gradient: const [Color(0xFF8E24AA), Color(0xFFAB47BC)],
                    onTap: () => Get.to(() => const AcademicCalendarView()),
                  ),
                  _DashTile(
                    icon: Icons.grade_outlined,
                    label: 'Exam Schedule\n& Results',
                    gradient: const [Color(0xFFD84315), Color(0xFFF4511E)],
                    onTap: () => Get.to(() => const ExamsView()),
                  ),
                  _DashTile(
                    icon: Icons.assignment_turned_in_outlined,
                    label: 'Leave & OD\nApplication',
                    gradient: const [Color(0xFF2E7D32), Color(0xFF43A047)],
                    onTap: () => Get.to(() => const LeaveApplicationView()),
                  ),
                  _DashTile(
                    icon: Icons.local_library_outlined,
                    label: 'Library Catalog\n& Books',
                    gradient: const [Color(0xFF00838F), Color(0xFF00ACC1)],
                    onTap: () => Get.to(() => const LibraryView()),
                  ),
                  _DashTile(
                    icon: Icons.currency_rupee_outlined,
                    label: 'Fee &\nHostel',
                    gradient: const [Color(0xFF6B3FA0), Color(0xFF9B59B6)],
                    onTap: () => Get.to(() => const FeeHostelView()),
                  ),
                  _DashTile(
                    icon: Icons.contact_page_outlined,
                    label: 'Counselling\nRecord',
                    gradient: const [Color(0xFF1C5C9A), Color(0xFF2980B9)],
                    onTap: () {
                      Get.to(() => CounsellingRecordView(
                            studentProfileId: user!.studentProfileId!,
                            canEdit: false,
                          ));
                    },
                  ),
                  _DashTile(
                    icon: Icons.report_problem_outlined,
                    label: 'Complaints &\nGrievances',
                    gradient: const [Color(0xFFC0392B), Color(0xFFE74C3C)],
                    onTap: () => Get.to(() => const MyComplaintsView()),
                  ),
                ]),
              ),
            ),
          ],
        );
      }),
    );
  }

  String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts.first.substring(0, 1).toUpperCase();
    return (parts.first.substring(0, 1) + parts.last.substring(0, 1)).toUpperCase();
  }

  void _confirmLogout(BuildContext context, dynamic auth) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: const [
            Icon(Icons.logout, color: Color(0xFF0B2545), size: 22),
            SizedBox(width: 10),
            Text('Confirm Logout', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          ],
        ),
        content: const Text(
          'Are you sure you want to log out of AVC Connect?',
          style: TextStyle(fontSize: 14, color: Colors.black87),
        ),
        actionsPadding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        actions: [
          OutlinedButton(
            onPressed: () => Navigator.of(ctx).pop(),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              auth.logout();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0B2545),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}

class _DashTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final List<Color> gradient;
  final VoidCallback onTap;
  final int badgeCount;

  const _DashTile({
    required this.icon,
    required this.label,
    required this.gradient,
    required this.onTap,
    this.badgeCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: gradient.first.withOpacity(0.35),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          splashColor: Colors.white12,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(icon, color: Colors.white, size: 22),
                    ),
                    if (badgeCount > 0)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.red.withOpacity(0.5),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Text(
                          '$badgeCount UNREAD',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    height: 1.25,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
