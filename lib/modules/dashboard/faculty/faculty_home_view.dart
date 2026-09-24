import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../academic_calendar/views/academic_calendar_view.dart';
import '../../attendance/views/faculty_classes_view.dart';
import '../../auth/controllers/auth_controller.dart';
import '../../complaints/views/manage_complaints_view.dart';
import '../../exams/views/exams_view.dart';
import '../../leave_od/views/faculty_leave_approval_view.dart';
import '../../library/views/library_view.dart';
import '../../notices/views/manage_notices_view.dart';
import '../../users/views/manage_users_view.dart';
import '../../../core/theme/app_theme.dart';

class FacultyHomeView extends StatelessWidget {
  const FacultyHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthController.to;
    final user = auth.currentUser.value;

    return Scaffold(
      backgroundColor: AppTheme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 180,
            pinned: true,
            backgroundColor: AppTheme.navy,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF0B2545), Color(0xFF1A4A80)],
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
                                CircleAvatar(
                                  radius: 22,
                                  backgroundColor: Colors.white.withOpacity(0.2),
                                  backgroundImage: (user?.photoUrl != null && File(user!.photoUrl!).existsSync())
                                      ? FileImage(File(user!.photoUrl!)) as ImageProvider
                                      : null,
                                  child: (user?.photoUrl == null || !File(user!.photoUrl!).existsSync())
                                      ? Text(
                                          _initials(user?.name ?? 'F'),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      : null,
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hello, ${user?.name.split(' ').first ?? 'Faculty'} 👋',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Text(
                                      'AVC Connect Faculty Portal',
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
                                'Faculty & Advisor Portal',
                                style: TextStyle(color: Colors.white70, fontSize: 12),
                              ),
                            ],
                          ),
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
                  icon: Icons.fact_check_outlined,
                  label: 'Mark\nAttendance',
                  gradient: const [Color(0xFF13A89E), Color(0xFF0D7A71)],
                  onTap: () => Get.to(() => const FacultyClassesView()),
                ),
                _DashTile(
                  icon: Icons.assignment_turned_in_outlined,
                  label: 'Student Leave\nApprovals',
                  gradient: const [Color(0xFF2E7D32), Color(0xFF43A047)],
                  onTap: () => Get.to(() => const FacultyLeaveApprovalView()),
                ),
                _DashTile(
                  icon: Icons.campaign_outlined,
                  label: 'Post Notice',
                  gradient: const [Color(0xFF0B2545), Color(0xFF1A3A6B)],
                  onTap: () => Get.to(() => const ManageNoticesView()),
                ),
                _DashTile(
                  icon: Icons.event_available_outlined,
                  label: 'Academic\nCalendar',
                  gradient: const [Color(0xFF8E24AA), Color(0xFFAB47BC)],
                  onTap: () => Get.to(() => const AcademicCalendarView()),
                ),
                _DashTile(
                  icon: Icons.grade_outlined,
                  label: 'Exams &\nSchedules',
                  gradient: const [Color(0xFFD84315), Color(0xFFF4511E)],
                  onTap: () => Get.to(() => const ExamsView()),
                ),
                _DashTile(
                  icon: Icons.local_library_outlined,
                  label: 'Library\nCatalog',
                  gradient: const [Color(0xFF00838F), Color(0xFF00ACC1)],
                  onTap: () => Get.to(() => const LibraryView()),
                ),
                _DashTile(
                  icon: Icons.report_problem_outlined,
                  label: 'Manage\nComplaints',
                  gradient: const [Color(0xFFC0392B), Color(0xFFE74C3C)],
                  onTap: () => Get.to(() => const ManageComplaintsView()),
                ),
                _DashTile(
                  icon: Icons.badge_outlined,
                  label: 'Students &\nCounselling',
                  gradient: const [Color(0xFF6B3FA0), Color(0xFF9B59B6)],
                  onTap: () => Get.to(() => const ManageUsersView()),
                ),
              ]),
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

  const _DashTile({
    required this.icon,
    required this.label,
    required this.gradient,
    required this.onTap,
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
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: Colors.white, size: 22),
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
