import 'package:flutter/material.dart';
import 'package:teams/app/di/di.dart';
import 'package:teams/domain/usecases/logout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('HomePage'),
            ElevatedButton(
              onPressed: () async {
                await getIt<Logout>()();
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
