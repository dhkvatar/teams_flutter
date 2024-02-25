import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:teams/app/di/di.dart';
import 'package:teams/core/navigation/routing_flow.dart';
import 'package:teams/presentation/blocs/login/login_bloc.dart';
import 'package:teams/presentation/pages/login_page.dart';
// import 'package:teams/presentation/pages/onboarding_page.dart';
import 'package:teams/presentation/pages/sign_up_page.dart';

const loginPage = 'login';

@lazySingleton
class LoginFlow extends RoutingFlow {
  @override
  RouteBase routes(GlobalKey<NavigatorState> rootNavigatorKey) {
    return GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      path: startingRoutePath,
      name: startingRoutePath,
      builder: (context, state) {
        return const SignUpPage();
        // return const OnboardingPage();
      },
      routes: [
        GoRoute(
          parentNavigatorKey: rootNavigatorKey,
          path: loginPage,
          name: '$startingRoutePath/$loginPage',
          pageBuilder: (context, state) => MaterialPage(
            child: BlocProvider(
              create: (_) => getIt<LoginBloc>(),
              child: LoginPage(),
            ),
          ),
        ),
      ],
    );
  }

  @override
  String get startingRoutePath => '/onboard';

  String get loginRoutePath => '$startingRoutePath/$loginPage';
}
