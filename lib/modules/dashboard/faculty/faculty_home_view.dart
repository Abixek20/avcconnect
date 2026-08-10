import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../auth/controllers/auth_controller.dart';
import '../../shared/widgets/dashboard_tile.dart';
import '../../attendance/views/faculty_classes_view.dart';
import '../../notices/views/manage_notices_view.dart';
import '../../complaints/views/manage_complaints_view.dart';

class FacultyHomeView extends StatelessWidget {
  const FacultyHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthController.to;
    final user = auth.currentUser.value;

    return Scaffold(
      appBar: AppBar(
        title: Text('Hi, ${user?.name ?? 'Faculty'}'),
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
              icon: Icons.fact_check_outlined,
              label: 'Mark\nAttendance',
              onTap: () => Get.to(() => const FacultyClassesView()),
            ),
            DashboardTile(
              icon: Icons.campaign_outlined,
              label: 'Post Notice',
              onTap: () => Get.to(() => const ManageNoticesView()),
            ),
            DashboardTile(
              icon: Icons.report_problem_outlined,
              label: 'Complaints',
              onTap: () => Get.to(() => const ManageComplaintsView()),
            ),
          ],
        ),
      ),
    );
  }
}
