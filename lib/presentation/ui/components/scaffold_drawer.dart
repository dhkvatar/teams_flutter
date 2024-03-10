import 'package:flutter/material.dart';
import 'package:teams/app/di/di.dart';
import 'package:teams/domain/usecases/authentication/get_current_user.dart';

class ScaffoldDrawer extends StatelessWidget {
  const ScaffoldDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final user = getIt<GetCurrentUser>()();
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('account name'),
            accountEmail: Text(user?.email ?? ''),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/soccer1.jpeg'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // context.go(getIt<HomeFlow>().settingsRoutePath);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              // context.go(getIt<HomeFlow>().profileRoutePath);
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('History'),
            onTap: () {
              // context.go(getIt<HomeFlow>().historyRoutePath);
            },
          )
        ],
      ),
    );
  }
}
