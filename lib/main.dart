import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/theme/app_theme.dart';
import 'data/services/database_service.dart';
import 'data/services/seed_service.dart';
import 'modules/auth/controllers/auth_controller.dart';
import 'modules/splash/views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DatabaseService.init();
  await SeedService.seedIfEmpty();

  Get.put(AuthController());

  runApp(const AVConnectApp());
}

class AVConnectApp extends StatelessWidget {
  const AVConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'AVConnect',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const SplashView(),
    );
  }
}