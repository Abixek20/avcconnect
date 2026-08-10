import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../auth/controllers/auth_controller.dart';
import '../../shared/widgets/dashboard_tile.dart';
import '../../notices/views/manage_notices_view.dart';
import '../../users/views/manage_users_view.dart';
import '../../complaints/views/manage_complaints_view.dart';

class AdminHomeView extends StatelessWidget {
  const AdminHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthController.to;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
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
              icon: Icons.campaign_outlined,
              label: 'Post Notice',
              onTap: () => Get.to(() => const ManageNoticesView()),
            ),
            DashboardTile(
              icon: Icons.people_outline,
              label: 'Manage Users',
              onTap: () => Get.to(() => const ManageUsersView()),
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
