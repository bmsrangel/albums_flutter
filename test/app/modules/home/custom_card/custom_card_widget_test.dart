import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:albums/app/modules/home/custom_card/custom_card_widget.dart';

main() {
  testWidgets('CustomCardWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(CustomCardWidget()));
    final textFinder = find.text('CustomCard');
    expect(textFinder, findsOneWidget);
  });
}
