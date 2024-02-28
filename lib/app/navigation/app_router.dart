import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:teams/app/di/di.dart';
import 'package:teams/domain/usecases/authentication/get_user_stream.dart';
import 'package:teams/domain/usecases/authentication/is_user_logged_in.dart';
import 'package:teams/presentation/flows/home_flow.dart';
import 'package:teams/presentation/flows/login_flow.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@lazySingleton
class AppRouter {
  final goRouter = GoRouter(
      initialLocation: getIt<LoginFlow>().startingRoutePath,
      routes: [
        getIt<LoginFlow>().routes(_rootNavigatorKey),
        getIt<HomeFlow>().routes(_rootNavigatorKey),
      ],
      navigatorKey: _rootNavigatorKey,
      refreshListenable: GoRouterRefreshStream(getIt<GetUserStream>()()),
      redirect: (context, state) {
        final loginFlow = getIt<LoginFlow>();
        final loggedIn = getIt<IsUserLoggedIn>()();
        final loggingIn =
            state.fullPath?.contains(loginFlow.startingRoutePath) ?? false;

        // Not logged-in, reroute to login page, unless already logging in.
        if (!loggedIn) {
          return loggingIn ? null : loginFlow.startingRoutePath;
        }
        // Logged-in, but still in login flow. Reroute to home page.
        if (loggingIn) {
          return getIt<HomeFlow>().startingRoutePath;
        }
        return null;
      });
}

class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription<dynamic> _subscription;

  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
