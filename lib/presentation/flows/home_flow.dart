import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:teams/app/di/di.dart';
import 'package:teams/core/constants/chat_constants.dart';
import 'package:teams/core/navigation/routing_flow.dart';
import 'package:teams/presentation/blocs/chat/chat_bloc.dart';
import 'package:teams/presentation/blocs/chat/chat_event.dart';
import 'package:teams/presentation/pages/chat_page.dart';
import 'package:teams/presentation/pages/home_page.dart';
import 'package:teams/presentation/ui/components/home_scaffold.dart';

final _shellNavigatorKey = GlobalKey<NavigatorState>();

const homeRoutePath = '/home';
const chatRoutePath = '/chat';

@lazySingleton
class HomeFlow extends RoutingFlow {
  @override
  String get startingRoutePath => homeRoutePath;

  @override
  RouteBase routes(GlobalKey<NavigatorState> rootNavigatorKey) {
    return ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, body) {
        return HomeScaffold(body: body);
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
          pageBuilder: (context, state) => MaterialPage(
            child: BlocProvider(
              create: (_) {
                return getIt<ChatBloc>()
                  ..add(const ChatGetChatsRequested(
                      limit: ChatConstants.chatPageSize));
              },
              child: const ChatPage(),
            ),
          ),
        ),
      ],
    );
  }
}
