import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teams/app/di/di.dart';
import 'package:teams/core/flavors/flavors.dart';
import 'package:teams/firebase_options_dev.dart' as fb_dev;
import 'package:teams/firebase_options_prod.dart' as fb_prod;

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();

  // Restrict device orientation to be potrait-up only.
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Set up app flavor.
  await Flavor.initializeAppFlavor();

  // Set up Firebase.
  switch (Flavor.appFlavor) {
    case AppFlavor.dev:
      await Firebase.initializeApp(
          options: fb_dev.DefaultFirebaseOptions.currentPlatform);
    case AppFlavor.prod:
      await Firebase.initializeApp(
          options: fb_prod.DefaultFirebaseOptions.currentPlatform);
    case null:
      break;
  }

  // Configure dependency injections.
  configureDependencies(Flavor.appFlavor!.name);
  runApp(await builder());
}
