import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:teams/app/di/di.dart';
import 'package:teams/presentation/navigation/login_flow.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@lazySingleton
class AppRouter {
  final goRouter = GoRouter(
    initialLocation: getIt<LoginFlow>().startingRoutePath,
    routes: [
      getIt<LoginFlow>().routes(_rootNavigatorKey),
    ],
    navigatorKey: _rootNavigatorKey,
  );
}
