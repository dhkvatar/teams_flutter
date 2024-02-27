import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: AppBar(
            bottom: const TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(text: 'DM'),
                Tab(text: 'Group Messages'),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            Icon(Icons.cabin),
            Icon(Icons.document_scanner),
          ],
        ),
      ),
    );
  }
}
