import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/theme/app_theme.dart';
import '../../../data/models/student_model.dart';
import '../../../data/models/user_model.dart';
import '../../../data/services/database_service.dart';
import '../../auth/controllers/auth_controller.dart';

class DigitalIdView extends StatefulWidget {
  const DigitalIdView({super.key});

  @override
  State<DigitalIdView> createState() => _DigitalIdViewState();
}

class _DigitalIdViewState extends State<DigitalIdView> {
  UserModel? user;
  StudentModel? student;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final isar = DatabaseService.instance;
    final currentUser = AuthController.to.currentUser.value;
    user = currentUser;

    if (currentUser != null && currentUser.studentProfileId != null) {
      student = await isar.studentModels.get(currentUser.studentProfileId!);
    }

    setState(() => isLoading = false);
  }

  Future<void> _pickAvatar() async {
    try {
      final picker = ImagePicker();
      final XFile? file = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 85,
      );
      if (file != null && user != null) {
        final isar = DatabaseService.instance;
        await isar.writeTxn(() async {
          user!.photoUrl = file.path;
          await isar.userModels.put(user!);
        });
        AuthController.to.currentUser.value = user;
        AuthController.to.currentUser.refresh();
        setState(() {});
        Get.snackbar(
          'Photo Updated',
          'Profile picture updated successfully.',
          backgroundColor: AppTheme.teal,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar('Error', 'Could not pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF091424),
      appBar: AppBar(
        title: const Text('Digital Student ID Card'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator(color: AppTheme.teal))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // ID Card Container
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF0F2B48), Color(0xFF1B4278), Color(0xFF0B203A)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.teal.withOpacity(0.3),
                          blurRadius: 20,
                          spreadRadius: 2,
                        ),
                      ],
                      border: Border.all(
                        color: Colors.white.withOpacity(0.25),
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Header Banner
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.08),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(22),
                              topRight: Radius.circular(22),
                            ),
                          ),
                          child: Column(
                            children: const [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.school, color: AppTheme.teal, size: 24),
                                  SizedBox(width: 8),
                                  Text(
                                    'A.V.C. COLLEGE OF ENGINEERING',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Mannampandal, Mayiladuthurai - 609305',
                                style: TextStyle(color: Colors.white60, fontSize: 11),
                              ),
                              Text(
                                'ANNA UNIVERSITY AFFILIATED • NAAC ACCREDITED',
                                style: TextStyle(color: AppTheme.teal, fontSize: 9, fontWeight: FontWeight.w700, letterSpacing: 0.8),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Photo & Essential Badges
                        Center(
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: AppTheme.teal, width: 3),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.4),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundColor: AppTheme.navy,
                                  backgroundImage: (user?.photoUrl != null && File(user!.photoUrl!).existsSync())
                                      ? FileImage(File(user!.photoUrl!)) as ImageProvider
                                      : null,
                                  child: (user?.photoUrl == null || !File(user!.photoUrl!).existsSync())
                                      ? Text(
                                          _initials(user?.name ?? 'S'),
                                          style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
                                        )
                                      : null,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: _pickAvatar,
                                  child: Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: const BoxDecoration(
                                      color: AppTheme.teal,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(Icons.camera_alt, color: Colors.white, size: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 14),

                        // Student Name & Roll No
                        Text(
                          user?.name.toUpperCase() ?? 'STUDENT NAME',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            letterSpacing: 0.8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 4),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppTheme.teal.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: AppTheme.teal.withOpacity(0.5)),
                            ),
                            child: Text(
                              student?.rollNumber ?? 'AU24CSE014',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),
                        const Divider(color: Colors.white24, height: 1),

                        // Info Grid
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              _infoRow('Department', student?.department ?? 'CSE'),
                              const SizedBox(height: 10),
                              _infoRow('Degree / Course', 'B.E. ${student?.department ?? 'CSE'}'),
                              const SizedBox(height: 10),
                              _infoRow('Year of Study', 'Year ${student?.yearOfStudy ?? 2} (Section ${student?.section ?? 'A'})'),
                              const SizedBox(height: 10),
                              _infoRow('Academic Batch', '2024 - 2028'),
                              const SizedBox(height: 10),
                              _infoRow('Accommodation', student?.hostelBlock ?? 'Day Scholar'),
                            ],
                          ),
                        ),

                        // Simulated QR Code & Security Strip
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(22),
                              bottomRight: Radius.circular(22),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  // Mock QR Code Box
                                  Container(
                                    width: 80,
                                    height: 80,
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: AppTheme.navy, width: 2),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: CustomPaint(
                                      painter: _QrPainter(),
                                    ),
                                  ),

                                  // Barcode strip
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'CAMPUS SCANNER CODE',
                                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.navy),
                                      ),
                                      const SizedBox(height: 4),
                                      Container(
                                        width: 160,
                                        height: 36,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: CustomPaint(
                                          painter: _BarcodePainter(),
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        '*${student?.rollNumber ?? 'AU24CSE014'}*',
                                        style: const TextStyle(fontSize: 10, fontFamily: 'monospace', color: Colors.black87),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.lock_outline, size: 12, color: Colors.green),
                                  SizedBox(width: 4),
                                  Text(
                                    'VALID STUDENT IDENTITY • 2026-2027',
                                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.green),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.white60, fontSize: 13)),
        Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
      ],
    );
  }

  String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts.first.substring(0, 1).toUpperCase();
    return (parts.first.substring(0, 1) + parts.last.substring(0, 1)).toUpperCase();
  }
}

class _QrPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFF0B2545);
    final w = size.width / 7;
    final h = size.height / 7;

    for (int r = 0; r < 7; r++) {
      for (int c = 0; c < 7; c++) {
        // Draw corner position squares & deterministic pattern
        if ((r < 2 && c < 2) || (r < 2 && c > 4) || (r > 4 && c < 2) || (r + c) % 2 == 0) {
          canvas.drawRect(Rect.fromLTWH(c * w, r * h, w - 1, h - 1), paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _BarcodePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black;
    double x = 4;
    final bars = [2, 1, 3, 1, 2, 4, 1, 2, 1, 3, 2, 1, 4, 2, 1, 3, 1, 2, 3, 1, 2];
    for (final bar in bars) {
      canvas.drawRect(Rect.fromLTWH(x, 2, bar.toDouble(), size.height - 4), paint);
      x += bar + 2;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
