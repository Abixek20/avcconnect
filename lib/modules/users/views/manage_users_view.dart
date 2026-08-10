import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_theme.dart';
import '../../../data/models/user_model.dart';
import '../controllers/manage_users_controller.dart';
import 'user_detail_view.dart';

class ManageUsersView extends StatelessWidget {
  const ManageUsersView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ManageUsersController());

    return Scaffold(
      appBar: AppBar(title: const Text('Manage Users')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Search by name or email',
                  prefixIcon: Icon(Icons.search, size: 20),
                  isDense: true,
                ),
                onChanged: (v) => controller.searchQuery.value = v,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _roleChip(controller, null, 'All'),
                    const SizedBox(width: 8),
                    _roleChip(controller, UserRole.student, 'Students'),
                    const SizedBox(width: 8),
                    _roleChip(controller, UserRole.faculty, 'Faculty'),
                    const SizedBox(width: 8),
                    _roleChip(controller, UserRole.admin, 'Admin'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Obx(() {
                final users = controller.filtered;
                if (users.isEmpty) {
                  return const Center(child: Text('No users match this search.'));
                }
                return RefreshIndicator(
                  onRefresh: controller.refresh,
                  child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    itemCount: users.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          backgroundColor: AppTheme.navy.withOpacity(0.1),
                          child: Text(
                            user.name.isNotEmpty ? user.name.substring(0, 1).toUpperCase() : '?',
                            style: const TextStyle(color: AppTheme.navy, fontWeight: FontWeight.bold),
                          ),
                        ),
                        title: Text(user.name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                        subtitle: Text(
                          '${_roleLabel(user.role)}${user.department != null ? ' • ${user.department}' : ''}',
                          style: const TextStyle(fontSize: 12),
                        ),
                        trailing: const Icon(Icons.chevron_right, color: Colors.black26),
                        onTap: () => Get.to(() => UserDetailView(user: user)),
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
        label: Text(label, style: const TextStyle(fontSize: 12)),
        selected: selected,
        selectedColor: AppTheme.navy,
        labelStyle: TextStyle(color: selected ? Colors.white : Colors.black87),
        onSelected: (_) => controller.roleFilter.value = role,
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
        return 'Admin';
    }
  }
}
