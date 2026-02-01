// Basic widget test for Prosper Design System

import 'package:flutter_test/flutter_test.dart';

import 'package:prosper_design_system/main.dart';

void main() {
  testWidgets('App renders correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProsperApp());

    // Verify that the app renders without errors
    expect(find.byType(ProsperApp), findsOneWidget);
  });
}
