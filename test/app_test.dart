import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teams/app.dart';

void main() {
  group('App', () {
    testWidgets('MaterialApp created', (widgetTester) async {
      await widgetTester.pumpWidget(const App());
      expect(find.byType(MaterialApp), findsOneWidget);
    });
  });
}
