import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:teams/core/navigation/routing_flow.dart';
import 'package:teams/presentation/pages/home_page.dart';

@lazySingleton
class HomeFlow extends RoutingFlow {
  @override
  String get startingRoutePath => '/home';

  @override
  RouteBase routes(GlobalKey<NavigatorState> rootNavigatorKey) {
    return GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      path: startingRoutePath,
      builder: (context, state) {
        return const HomePage();
      },
    );
  }
}
