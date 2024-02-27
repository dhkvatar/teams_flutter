import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:teams/core/navigation/routing_flow.dart';
import 'package:teams/presentation/pages/home_page.dart';
import 'package:teams/presentation/ui/components/home_scaffold.dart';

final _shellNavigatorKey = GlobalKey<NavigatorState>();

@lazySingleton
class HomeFlow extends RoutingFlow {
  @override
  String get startingRoutePath => '/home';

  @override
  RouteBase routes(GlobalKey<NavigatorState> rootNavigatorKey) {
    return ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, body) {
        return HomeScaffold(body: body);
      },
      routes: [
        GoRoute(
          path: startingRoutePath,
          builder: (context, state) {
            return const HomePage();
          },
        )
      ],
    );
  }
}
