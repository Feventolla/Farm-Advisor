// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:farmadvisor/screens/Dashboard/FarmDashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// import 'package:scrolling/main.dart';

void main() {
  testWidgets('scrollability test', (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const FarmDashboard(
        // items: List<String>.generate(10000, (i) => 'Item $i'),
        ));
    await tester.drag(find.byType(ListView), const Offset(0, -300));
    await tester.pump();
    final first = find.text('Title 0');
    expect(first, findsOneWidget);

    final listFinder = find.byType(Scrollable);
    final itemFinder = find.byKey(const ValueKey('item_50_text'));

    // Scroll until the item to be found appears.
    await tester.scrollUntilVisible(
      itemFinder,
      500.0,
      scrollable: listFinder,
    );

    // Verify that the item contains the correct text.
    expect(itemFinder, findsOneWidget);
  });
}
