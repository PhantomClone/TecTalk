import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:tec_talk/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter', (tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.text('0'), findsOneWidget);

      sleep(const Duration(seconds: 5));

      final plusButton = find.byKey(const ValueKey('increment'));

      await tester.tap(plusButton);
      await tester.pumpAndSettle();

      expect(find.text('1'), findsOneWidget);
      sleep(const Duration(seconds: 5));
    });

    testWidgets('tap on the checkbox, verify change',
            (tester) async {

          await tester.pumpWidget(const MyApp());

          final box = find.byType(Checkbox).first;

          expect(tester.getSemantics(box), matchesSemantics(
            hasTapAction: true,
            hasCheckedState: true,
            isChecked: false,
            hasEnabledState: true,
            isEnabled: true,
            isFocusable: true,
          ));

          await tester.tap(box);

          await tester.pumpAndSettle();

          expect(tester.getSemantics(box), matchesSemantics(
            hasTapAction: true,
            hasCheckedState: true,
            isChecked: true,
            hasEnabledState: true,
            isEnabled: true,
            isFocusable: true,
          ));
        });
  });

}