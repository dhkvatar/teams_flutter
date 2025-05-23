import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:teams/app/di/di.dart';
import 'package:teams/core/navigation/routing_flow.dart';
import 'package:teams/presentation/blocs/chat/chat_bloc.dart';
import 'package:teams/presentation/pages/chat_details_page.dart';
import 'package:teams/presentation/pages/chat_page.dart';
import 'package:teams/presentation/pages/home_page.dart';

final _shellNavigatorKey = GlobalKey<NavigatorState>();

const homeRoutePath = '/home';
const chatRoutePath = '/chat';

@lazySingleton
class HomeFlow extends RoutingFlow {
  @override
  String get startingRoutePath => homeRoutePath;

  static String chatDetailsRoutePath(String chatId) => '$chatRoutePath/$chatId';

  @override
  RouteBase routes(GlobalKey<NavigatorState> rootNavigatorKey) {
    return ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, goRouterState, body) {
        return BlocProvider(
          create: (_) => getIt<ChatBloc>(),
          child: Scaffold(body: body),
        );
      },
      routes: [
        // The Home screen
        GoRoute(
          path: startingRoutePath,
          builder: (context, state) {
            return const HomePage();
          },
        ),

        // The Chat screen
        GoRoute(
          path: chatRoutePath,
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: ChatPage(),
            );
          },
          routes: [
            GoRoute(
              path: ':chatId',
              pageBuilder: (context, state) => MaterialPage(
                child: ChatDetailsPage(
                  chatId: state.pathParameters['chatId']!,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
