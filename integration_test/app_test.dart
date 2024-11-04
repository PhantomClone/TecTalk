import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:tec_talk/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("end to end", () {
    testWidgets("tap on button, verfiy result", (tester) async {

      await tester.pumpWidget(const MyApp());

      expect(find.text('0'), findsOneWidget);

      final plusButton = find.byKey(const ValueKey('increment'));

      sleep(const Duration(seconds: 3,));
      await tester.tap(plusButton);

      await tester.pumpAndSettle();
      sleep(const Duration(seconds: 3,));

      expect(find.text('1'), findsOneWidget);
    });


  });


}