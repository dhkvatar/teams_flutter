import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:teams/app/navigation/home_screen.dart';

@lazySingleton
class AppRouter {
  final goRouter = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
