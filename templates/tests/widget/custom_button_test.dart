import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_enterprise_template/core/widgets/custom_button.dart';

Widget _wrapWithScreenUtil(Widget child) {
  return ScreenUtilInit(
    designSize: const Size(375, 812),
    builder: (_, __) => MaterialApp(
      home: Scaffold(body: Center(child: child)),
    ),
  );
}

void main() {
  group('CustomButton Widget Tests', () {
    testWidgets('renders button with text and triggers onPressed on tap', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        _wrapWithScreenUtil(
          CustomButton(
            text: 'Click Me',
            onPressed: () => tapped = true,
          ),
        ),
      );

      expect(find.text('Click Me'), findsOneWidget);

      await tester.tap(find.text('Click Me'));
      await tester.pump();

      expect(tapped, isTrue);
    });

    testWidgets('shows loading spinner when isLoading is true and ignores taps', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        _wrapWithScreenUtil(
          CustomButton(
            text: 'Loading Test',
            isLoading: true,
            onPressed: () => tapped = true,
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Loading Test'), findsNothing);

      await tester.tap(find.byType(CustomButton));
      await tester.pump();

      expect(tapped, isFalse);
    });
  });
}
