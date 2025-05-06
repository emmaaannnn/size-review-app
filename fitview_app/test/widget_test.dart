// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    // Verify the presence of the Add button
    expect(find.byIcon(Icons.add), findsOneWidget);

    // Tap the add button
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Check if the overlay for adding an expense appears
    expect(find.text('Expense Title'), findsOneWidget);
    expect(find.text('Expense Amount'), findsOneWidget);
    expect(find.text('Save Expense'), findsOneWidget);

  });
}
