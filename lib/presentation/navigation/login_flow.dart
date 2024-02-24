import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:teams/app/navigation/home_screen.dart';
import 'package:teams/core/navigation/routing_flow.dart';

@lazySingleton
class LoginFlow extends RoutingFlow {
  @override
  RouteBase routes(GlobalKey<NavigatorState> rootNavigatorKey) {
    return GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      path: startingRoutePath,
      name: startingRoutePath,
      builder: (context, state) {
        return const HomeScreen();
      },
    );
  }

  @override
  String get startingRoutePath => '/login';
}
