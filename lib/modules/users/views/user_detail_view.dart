import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_theme.dart';
import '../../../data/models/faculty_model.dart';
import '../../../data/models/student_model.dart';
import '../../../data/models/user_model.dart';
import '../../../data/services/database_service.dart';
import '../../auth/controllers/auth_controller.dart';
import '../../counselling/views/counselling_record_view.dart';

class UserDetailView extends StatelessWidget {
  final UserModel user;

  const UserDetailView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: FutureBuilder<_ProfileExtras>(
        future: _loadExtras(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final extras = snapshot.data!;
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Center(
                child: CircleAvatar(
                  radius: 36,
                  backgroundColor: AppTheme.navy.withOpacity(0.1),
                  child: Text(
                    _initials(user.name),
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppTheme.navy),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: Text(user.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 4),
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppTheme.teal.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    _roleLabel(user.role),
                    style: const TextStyle(fontSize: 12, color: AppTheme.teal, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              _infoTile(Icons.email_outlined, 'Email', user.email),
              if (user.department != null) _infoTile(Icons.apartment_outlined, 'Department', user.department!),
              if (extras.student != null) ...[
                _infoTile(Icons.badge_outlined, 'Roll Number', extras.student!.rollNumber),
                _infoTile(Icons.school_outlined, 'Year of Study', 'Year ${extras.student!.yearOfStudy}'),
                _infoTile(Icons.group_outlined, 'Section', extras.student!.section),
                _infoTile(
                  Icons.holiday_village_outlined,
                  'Hostel',
                  extras.student!.hostelBlock == null
                      ? 'Day Scholar'
                      : '${extras.student!.hostelBlock} • Room ${extras.student!.roomNumber ?? '-'}',
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.navy,
                    foregroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(48),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  icon: const Icon(Icons.badge_outlined),
                  label: const Text('View Counselling Record'),
                  onPressed: () {
                    final currentUser = AuthController.to.currentUser.value;
                    final isFacultyOrAdmin = currentUser?.role == UserRole.faculty || currentUser?.role == UserRole.admin;
                    Get.to(() => CounsellingRecordView(
                          studentProfileId: extras.student!.id,
                          canEdit: isFacultyOrAdmin,
                        ));
                  },
                ),
              ],
              if (extras.faculty != null) ...[
                _infoTile(Icons.work_outline, 'Designation', extras.faculty!.designation),
                _infoTile(
                  Icons.menu_book_outlined,
                  'Subjects Taught',
                  extras.faculty!.subjectsTaught.isEmpty ? '-' : extras.faculty!.subjectsTaught.join(', '),
                ),
              ],
            ],
          );
        },
      ),
    );
  }

  Future<_ProfileExtras> _loadExtras() async {
    final isar = DatabaseService.instance;
    StudentModel? student;
    FacultyModel? faculty;

    if (user.studentProfileId != null) {
      student = await isar.studentModels.get(user.studentProfileId!);
    }
    if (user.facultyProfileId != null) {
      faculty = await isar.facultyModels.get(user.facultyProfileId!);
    }
    return _ProfileExtras(student: student, faculty: faculty);
  }

  Widget _infoTile(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(icon, color: AppTheme.navy, size: 20),
        title: Text(label, style: const TextStyle(fontSize: 12, color: Colors.black54)),
        subtitle: Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      ),
    );
  }

  String _roleLabel(UserRole role) {
    switch (role) {
      case UserRole.student:
        return 'Student';
      case UserRole.faculty:
        return 'Faculty';
      case UserRole.admin:
        return 'Admin';
    }
  }

  String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts.first.substring(0, 1).toUpperCase();
    return (parts.first.substring(0, 1) + parts.last.substring(0, 1)).toUpperCase();
  }
}

class _ProfileExtras {
  final StudentModel? student;
  final FacultyModel? faculty;

  _ProfileExtras({this.student, this.faculty});
}
