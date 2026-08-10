import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_theme.dart';
import '../../../data/models/notice_model.dart';
import '../controllers/manage_notices_controller.dart';
import 'compose_notice_view.dart';

class ManageNoticesView extends StatelessWidget {
  const ManageNoticesView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ManageNoticesController());

    return Scaffold(
      appBar: AppBar(title: const Text('Notices')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final posted = await Get.to(() => const ComposeNoticeView());
          if (posted == true) controller.refresh();
        },
        icon: const Icon(Icons.add),
        label: const Text('New Notice'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.notices.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Text('No notices posted yet. Tap "New Notice" to post one.', textAlign: TextAlign.center),
            ),
          );
        }
        return RefreshIndicator(
          onRefresh: controller.refresh,
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 90),
            itemCount: controller.notices.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final notice = controller.notices[index];
              final audience = _audienceLabel(notice.departmentFilter, notice.yearFilter);
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.campaign_outlined, color: AppTheme.teal, size: 18),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(notice.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete_outline, size: 20, color: Colors.black38),
                            onPressed: () => _confirmDelete(context, controller, notice),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(notice.body, style: const TextStyle(fontSize: 13)),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        runSpacing: 6,
                        children: [
                          Chip(
                            label: Text(audience, style: const TextStyle(fontSize: 11)),
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          Text(
                            DateFormat('MMM d, yyyy').format(notice.postedAt),
                            style: const TextStyle(fontSize: 11, color: Colors.black45),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }

  String _audienceLabel(String? dept, int? year) {
    if (dept == null && year == null) return 'All students';
    if (dept != null && year == null) return dept;
    if (dept == null && year != null) return 'Year $year';
    return '$dept • Year $year';
  }

  void _confirmDelete(BuildContext context, ManageNoticesController controller, NoticeModel notice) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete notice?'),
        content: Text('This will remove "${notice.title}" permanently.'),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              controller.delete(notice);
              Get.back();
            },
            child: const Text('Delete', style: TextStyle(color: Colors.redAccent)),
          ),
        ],
      ),
    );
  }
}
