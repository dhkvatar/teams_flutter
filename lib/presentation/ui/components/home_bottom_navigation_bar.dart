import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:teams/presentation/flows/home_flow.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  HomeBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Teams',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.sports_soccer),
          label: 'My Games',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart),
          label: 'Stats',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Messages',
        ),
      ],
      currentIndex: _getSelectedIndex(context),
      onTap: (idx) => _onItemTapped(idx, context),
    );
  }

  final Map<String, int> _routePathToNavBarIndex = {
    homeRoutePath: 0,
    chatRoutePath: 4,
  };

  int _getSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(homeRoutePath)) {
      return _routePathToNavBarIndex[homeRoutePath]!;
    }
    if (location.startsWith(chatRoutePath)) {
      return _routePathToNavBarIndex[chatRoutePath]!;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go(homeRoutePath);
      case 4:
        context.go(chatRoutePath);
      default:
        context.go(homeRoutePath);
    }
  }
}
