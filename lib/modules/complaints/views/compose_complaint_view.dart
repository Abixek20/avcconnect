import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_theme.dart';
import '../../../data/models/complaint_model.dart';
import '../complaint_display_helpers.dart';
import '../controllers/compose_complaint_controller.dart';

class ComposeComplaintView extends StatefulWidget {
  const ComposeComplaintView({super.key});

  @override
  State<ComposeComplaintView> createState() => _ComposeComplaintViewState();
}

class _ComposeComplaintViewState extends State<ComposeComplaintView> {
  final _descriptionCtrl = TextEditingController();
  late final ComposeComplaintController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(ComposeComplaintController());
  }

  @override
  void dispose() {
    _descriptionCtrl.dispose();
    Get.delete<ComposeComplaintController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Complaint')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Category', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
          const SizedBox(height: 10),
          Obx(() => Wrap(
                spacing: 8,
                runSpacing: 8,
                children: ComplaintCategory.values.map((cat) {
                  final selected = controller.category.value == cat;
                  return ChoiceChip(
                    label: Text(complaintCategoryLabel(cat)),
                    avatar: Icon(
                      complaintCategoryIcon(cat),
                      size: 16,
                      color: selected ? Colors.white : AppTheme.navy,
                    ),
                    selected: selected,
                    selectedColor: AppTheme.navy,
                    labelStyle: TextStyle(
                      color: selected ? Colors.white : Colors.black87,
                      fontSize: 12,
                    ),
                    onSelected: (_) => controller.category.value = cat,
                  );
                }).toList(),
              )),
          const SizedBox(height: 20),
          TextField(
            controller: _descriptionCtrl,
            maxLines: 6,
            decoration: const InputDecoration(
              labelText: 'Describe the issue',
              alignLabelWithHint: true,
            ),
          ),
          const SizedBox(height: 20),
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
                  onPressed: controller.isSubmitting.value ? null : _submit,
                  icon: controller.isSubmitting.value
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                        )
                      : const Icon(Icons.send_outlined),
                  label: const Text('Submit Complaint'),
                ),
              )),
        ],
      ),
    );
  }

  Future<void> _submit() async {
    final success = await controller.submit(_descriptionCtrl.text);
    if (success && mounted) {
      Get.back(result: true);
      Get.snackbar(
        'Complaint submitted',
        'We\'ve logged your complaint and will follow up.',
        backgroundColor: AppTheme.teal,
        colorText: Colors.white,
      );
    }
  }
}
