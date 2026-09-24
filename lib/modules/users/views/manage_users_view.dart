import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_theme.dart';
import '../../../data/models/user_model.dart';
import '../../shared/widgets/skeleton_loader.dart';
import '../controllers/manage_users_controller.dart';
import 'user_detail_view.dart';

class ManageUsersView extends StatelessWidget {
  const ManageUsersView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ManageUsersController());

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Manage Users & Directory'),
        backgroundColor: AppTheme.navy,
        foregroundColor: Colors.white,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const ListSkeleton(itemCount: 6, cardHeight: 80);
        }

        return Column(
          children: [
            Container(
              color: AppTheme.navy,
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
              child: Column(
                children: [
                  TextField(
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    decoration: InputDecoration(
                      hintText: 'Search by name, email, department...',
                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                      prefixIcon: const Icon(Icons.search, color: Colors.white70, size: 20),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.12),
                      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (v) => controller.searchQuery.value = v,
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _roleChip(controller, null, 'All Users'),
                        const SizedBox(width: 8),
                        _roleChip(controller, UserRole.student, 'Students'),
                        const SizedBox(width: 8),
                        _roleChip(controller, UserRole.faculty, 'Faculty'),
                        const SizedBox(width: 8),
                        _roleChip(controller, UserRole.admin, 'Administrators'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                final users = controller.filtered;
                if (users.isEmpty) {
                  return RefreshIndicator(
                    onRefresh: controller.refresh,
                    child: ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: const [
                        SizedBox(height: 100),
                        Center(child: Text('No users match your filter.', style: TextStyle(color: Colors.black54))),
                      ],
                    ),
                  );
                }
                return RefreshIndicator(
                  onRefresh: controller.refresh,
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: users.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.03),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                          leading: CircleAvatar(
                            backgroundColor: AppTheme.navy,
                            backgroundImage: (user.photoUrl != null && File(user.photoUrl!).existsSync())
                                ? FileImage(File(user.photoUrl!)) as ImageProvider
                                : null,
                            child: (user.photoUrl == null || !File(user.photoUrl!).existsSync())
                                ? Text(
                                    user.name.isNotEmpty ? user.name.substring(0, 1).toUpperCase() : '?',
                                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  )
                                : null,
                          ),
                          title: Text(user.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppTheme.navy)),
                          subtitle: Text(
                            '${_roleLabel(user.role)}${user.department != null ? ' • ${user.department}' : ''}\n${user.email}',
                            style: const TextStyle(fontSize: 11, color: Colors.black54),
                          ),
                          isThreeLine: true,
                          trailing: const Icon(Icons.chevron_right, color: Colors.black38),
                          onTap: () => Get.to(() => UserDetailView(user: user)),
                        ),
                      );
                    },
                  ),
                );
              }),
            ),
          ],
        );
      }),
    );
  }

  Widget _roleChip(ManageUsersController controller, UserRole? role, String label) {
    return Obx(() {
      final selected = controller.roleFilter.value == role;
      return ChoiceChip(
        label: Text(label),
        selected: selected,
        onSelected: (_) => controller.roleFilter.value = role,
        selectedColor: AppTheme.teal,
        backgroundColor: Colors.white.withOpacity(0.12),
        labelStyle: TextStyle(
          color: selected ? Colors.white : Colors.white70,
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          fontSize: 12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        showCheckmark: false,
        side: BorderSide.none,
      );
    });
  }

  String _roleLabel(UserRole role) {
    switch (role) {
      case UserRole.student:
        return 'Student';
      case UserRole.faculty:
        return 'Faculty';
      case UserRole.admin:
        return 'Administrator';
    }
  }
}
