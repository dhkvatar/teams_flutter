import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:teams/core/navigation/routing_flow.dart';
import 'package:teams/presentation/pages/login_page.dart';
// import 'package:teams/presentation/pages/onboarding_page.dart';

@lazySingleton
class LoginFlow extends RoutingFlow {
  @override
  RouteBase routes(GlobalKey<NavigatorState> rootNavigatorKey) {
    return GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      path: startingRoutePath,
      name: startingRoutePath,
      builder: (context, state) {
        return LoginPage();
        // return const OnboardingPage();
      },
    );
  }

  @override
  String get startingRoutePath => '/login';
}
