import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../../../core/theme/app_theme.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController(text: 'au24cse014@avcconnect.edu');
  final passwordController = TextEditingController(text: 'student123');
  final auth = AuthController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.navy,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),
                _buildHeader(),
                const SizedBox(height: 36),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock_outline),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Obx(() {
                        final error = auth.errorMessage.value;
                        if (error == null) return const SizedBox.shrink();
                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(error, style: const TextStyle(color: Colors.red)),
                        );
                      }),
                      const SizedBox(height: 20),
                      Obx(() => ElevatedButton(
                            onPressed: auth.isLoading.value
                                ? null
                                : () async {
                                    final ok = await auth.login(
                                      emailController.text,
                                      passwordController.text,
                                    );
                                    if (ok) {
                                      Get.offAllNamed(auth.homeRoute);
                                    }
                                  },
                            child: auth.isLoading.value
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(strokeWidth: 2),
                                  )
                                : const Text('Log In'),
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                _buildDemoHint(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          height: 72,
          width: 72,
          decoration: BoxDecoration(
            color: AppTheme.teal,
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Icon(Icons.school, color: Colors.white, size: 36),
        ),
        const SizedBox(height: 16),
        const Text(
          'AVConnect',
          style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const Text(
          'A.V.C. College of Engineering',
          style: TextStyle(color: Colors.white70, fontSize: 13),
        ),
      ],
    );
  }

  Widget _buildDemoHint() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Text(
        'Demo logins (password shown):\n'
        'Student  → au24cse014@avcconnect.edu / student123\n'
        'Faculty  → kalaiselvi@avcconnect.edu / faculty123\n'
        'Admin    → admin@avcconnect.edu / admin123',
        style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.5),
      ),
    );
  }
}