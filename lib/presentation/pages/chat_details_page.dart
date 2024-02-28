import 'package:flutter/material.dart';

class ChatDetailsPage extends StatelessWidget {
  const ChatDetailsPage({super.key, required this.chatId});

  final String chatId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatDetailsPage: $chatId'),
      ),
    );
  }
}
