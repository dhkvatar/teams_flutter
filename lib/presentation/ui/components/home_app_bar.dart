import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key, this.bottom});

  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('AppBar'),
      // The user profile avatar.
      leading: GestureDetector(
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(),
        ),
        onTap: () => Scaffold.of(context).openDrawer(),
      ),

      bottom: bottom,
      shape: Border(
        bottom: BorderSide(color: Colors.grey.shade400, width: 0.3),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
