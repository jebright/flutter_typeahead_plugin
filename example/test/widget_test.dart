// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/main.dart';
import 'package:flutter_typeahead_plugin/type_ahead.dart';

void main() {
  testWidgets('Verify Typeahead Setup', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(new MyApp());

    // Verify that the TypeAhead widget is found.
    expect(
        find.byWidgetPredicate(
          (Widget widget) =>
              widget is TypeAhead,
        ),
        findsOneWidget);
  });
}
