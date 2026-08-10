import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_theme.dart';
import '../controllers/compose_notice_controller.dart';

class ComposeNoticeView extends StatefulWidget {
  const ComposeNoticeView({super.key});

  @override
  State<ComposeNoticeView> createState() => _ComposeNoticeViewState();
}

class _ComposeNoticeViewState extends State<ComposeNoticeView> {
  final _titleCtrl = TextEditingController();
  final _bodyCtrl = TextEditingController();
  late final ComposeNoticeController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(ComposeNoticeController());
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    _bodyCtrl.dispose();
    Get.delete<ComposeNoticeController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Notice')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: _titleCtrl,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          const SizedBox(height: 14),
          TextField(
            controller: _bodyCtrl,
            maxLines: 6,
            decoration: const InputDecoration(
              labelText: 'Notice body',
              alignLabelWithHint: true,
            ),
          ),
          const SizedBox(height: 20),
          const Text('Target audience (optional)', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
          const SizedBox(height: 4),
          const Text(
            'Leave as "All" to show this notice campus-wide.',
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
          const SizedBox(height: 10),
          Obx(() => DropdownButtonFormField<String?>(
                value: controller.departmentFilter.value,
                decoration: const InputDecoration(labelText: 'Department'),
                items: [
                  const DropdownMenuItem(value: null, child: Text('All departments')),
                  ...ComposeNoticeController.departments.map(
                    (d) => DropdownMenuItem(value: d, child: Text(d)),
                  ),
                ],
                onChanged: (v) => controller.departmentFilter.value = v,
              )),
          const SizedBox(height: 12),
          Obx(() => DropdownButtonFormField<int?>(
                value: controller.yearFilter.value,
                decoration: const InputDecoration(labelText: 'Year of study'),
                items: const [
                  DropdownMenuItem(value: null, child: Text('All years')),
                  DropdownMenuItem(value: 1, child: Text('Year 1')),
                  DropdownMenuItem(value: 2, child: Text('Year 2')),
                  DropdownMenuItem(value: 3, child: Text('Year 3')),
                  DropdownMenuItem(value: 4, child: Text('Year 4')),
                ],
                onChanged: (v) => controller.yearFilter.value = v,
              )),
          const SizedBox(height: 24),
          Obx(() {
            final error = controller.errorMessage.value;
            if (error == null) return const SizedBox.shrink();
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(error, style: const TextStyle(color: Colors.redAccent, fontSize: 12)),
            );
          }),
          Obx(() => SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: controller.isPosting.value ? null : _submit,
                  icon: controller.isPosting.value
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                        )
                      : const Icon(Icons.send_outlined),
                  label: const Text('Post Notice'),
                ),
              )),
        ],
      ),
    );
  }

  Future<void> _submit() async {
    final success = await controller.post(title: _titleCtrl.text, body: _bodyCtrl.text);
    if (success && mounted) {
      Get.back(result: true);
      Get.snackbar(
        'Notice posted',
        'Your notice is now live.',
        backgroundColor: AppTheme.teal,
        colorText: Colors.white,
      );
    }
  }
}
