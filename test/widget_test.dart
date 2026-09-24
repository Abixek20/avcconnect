import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

import 'package:avconnect/main.dart';
import 'package:avconnect/modules/auth/controllers/auth_controller.dart';

void main() {
  testWidgets('AVConnect App smoke test', (WidgetTester tester) async {
    Get.put(AuthController());
    await tester.pumpWidget(const AVConnectApp());
    await tester.pump(const Duration(seconds: 2));
    expect(find.byType(AVConnectApp), findsOneWidget);
  });
}
