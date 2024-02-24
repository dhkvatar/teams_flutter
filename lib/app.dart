import 'package:flutter/material.dart';
import 'package:teams/core/flavors/flavors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('App-${Flavor.appFlavor!.name}')),
      ),
    );
  }
}
