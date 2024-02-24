import 'package:flutter/material.dart';
import 'package:teams/app/di/di.dart';
import 'package:teams/app/navigation/app_router.dart';
import 'package:teams/core/flavors/flavors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>().goRouter;

    return MaterialApp.router(
      title: 'App-${Flavor.appFlavor!.name}',
      routerConfig: router,
      debugShowCheckedModeBanner: Flavor.appFlavor != AppFlavor.prod,
    );
  }
}
