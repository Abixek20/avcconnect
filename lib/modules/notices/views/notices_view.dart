import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/notices_controller.dart';
import '../../../core/theme/app_theme.dart';

class NoticesView extends StatelessWidget {
  const NoticesView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NoticesController());

    return Scaffold(
      appBar: AppBar(title: const Text('Notices')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.notices.isEmpty) {
          return const Center(child: Text('No notices yet.'));
        }
        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: controller.notices.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final notice = controller.notices[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.campaign_outlined, color: AppTheme.teal, size: 18),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(notice.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(notice.body, style: const TextStyle(fontSize: 13)),
                    const SizedBox(height: 8),
                    Text(
                      DateFormat('MMM d, yyyy').format(notice.postedAt),
                      style: const TextStyle(fontSize: 11, color: Colors.black45),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}