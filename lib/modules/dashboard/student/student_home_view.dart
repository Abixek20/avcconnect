import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../auth/controllers/auth_controller.dart';
import '../../shared/widgets/dashboard_tile.dart';
import '../../timetable/views/timetable_view.dart';
import '../../notices/views/notices_view.dart';
import '../../fee_hostel/views/fee_hostel_view.dart';
import '../../complaints/views/my_complaints_view.dart';
import '../../fees/views/fee_view.dart';
import '../../counselling/views/counselling_record_view.dart';
import '../../complaints/views/complaint_view.dart';

class StudentHomeView extends StatelessWidget {
  const StudentHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthController.to;
    final user = auth.currentUser.value;

    return Scaffold(
      appBar: AppBar(
        title: Text('Hi, ${user?.name.split(' ').first ?? 'Student'}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: auth.logout,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.78,
          children: [
            DashboardTile(
              icon: Icons.calendar_month,
              label: 'Timetable &\nAttendance',
              onTap: () => Get.to(() => const TimetableView()),
            ),
            DashboardTile(
              icon: Icons.campaign_outlined,
              label: 'Notices',
              onTap: () => Get.to(() => const NoticesView()),
            ),
            DashboardTile(
              icon: Icons.currency_rupee,
              label: 'Fee & Hostel',
              onTap: () => Get.to(() => const FeeView()),
            ),
            DashboardTile(
  icon: Icons.badge_outlined,
  label: 'Counselling\nRecord',
  onTap: () {
    final user = auth.currentUser.value!;
    Get.to(() => CounsellingRecordView(
      studentProfileId: user.studentProfileId!,
      canEdit: false,
    ));
  },
),
            DashboardTile(
              icon: Icons.report_problem_outlined,
              label: 'Complaints',
              onTap: () => Get.to(() => const ComplaintView()),
            ),
          ],
        ),
      ),
    );
  }
}
