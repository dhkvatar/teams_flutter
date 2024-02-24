import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teams/main.dart';

void main() {
  group('App', () {
    testWidgets('MaterialApp created', (widgetTester) async {
      await widgetTester.pumpWidget(const MainApp());
      expect(find.byType(MaterialApp), findsOneWidget);
    });
  });
}
