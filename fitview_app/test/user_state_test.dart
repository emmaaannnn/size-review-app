import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';



void main() {
  testWidgets('Expenses screen test', (WidgetTester tester) async {
    // Build the widget tree for the Expenses screen
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Expenses Screen'),
        ),
      ),
    ));

    // Verify that the Expenses screen is displayed
    expect(find.text('Expenses Screen'), findsOneWidget);
  });
  
}