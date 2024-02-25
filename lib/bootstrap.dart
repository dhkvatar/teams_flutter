import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teams/app/di/di.dart';
import 'package:teams/core/flavors/flavors.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  configureDependencies(Flavor.appFlavor!.name);
  runApp(await builder());
}
