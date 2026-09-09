import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_enterprise_template/core/widgets/custom_text_field.dart';

Widget _wrapWithScreenUtil(Widget child) {
  return ScreenUtilInit(
    designSize: const Size(375, 812),
    builder: (_, __) => MaterialApp(
      home: Scaffold(body: Center(child: child)),
    ),
  );
}

void main() {
  group('CustomTextField Widget Tests', () {
    testWidgets('renders hint text and accepts user input', (tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(
        _wrapWithScreenUtil(
          CustomTextField(
            controller: controller,
            hintText: 'Enter email',
          ),
        ),
      );

      expect(find.text('Enter email'), findsOneWidget);

      await tester.enterText(find.byType(CustomTextField), 'test@example.com');
      await tester.pump();

      expect(controller.text, 'test@example.com');
      controller.dispose();
    });
  });
}
