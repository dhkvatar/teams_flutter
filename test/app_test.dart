import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teams/app/app.dart';
import 'package:teams/app/di/di.dart';
import 'package:teams/core/flavors/flavors.dart';

void main() {
  group('App', () {
    setUp(() async {
      await Flavor.initializeAppFlavor(AppFlavor.dev);
      configureDependencies(Flavor.appFlavor!.name);
    });
    testWidgets('MaterialApp created', (widgetTester) async {
      await widgetTester.pumpWidget(const App());
      expect(find.byType(MaterialApp), findsOneWidget);
    });
  });
}
