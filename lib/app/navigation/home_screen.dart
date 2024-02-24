import 'package:flutter/material.dart';
import 'package:teams/core/flavors/flavors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home-${Flavor.appFlavor!.name}')),
    );
  }
}
