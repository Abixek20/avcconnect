import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import 'login_view.dart';
import '../../dashboard/student/student_home_view.dart';
import '../../dashboard/faculty/faculty_home_view.dart';
import '../../dashboard/admin/admin_home_view.dart';
import '../../../data/models/user_model.dart';

/// Reactively shows the right screen based on auth state - no manual
/// navigation calls needed on login/logout, avoids the stale `home:`
/// routing bug we hit early on in ITS Expense Tracker.
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthController.to;

    return Obx(() {
      final user = auth.currentUser.value;

      if (user == null) {
        return const LoginView();
      }

      switch (user.role) {
        case UserRole.student:
          return const StudentHomeView();
        case UserRole.faculty:
          return const FacultyHomeView();
        case UserRole.admin:
          return const AdminHomeView();
      }
    });
  }
}