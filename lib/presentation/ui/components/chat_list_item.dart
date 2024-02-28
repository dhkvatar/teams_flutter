import 'package:flutter/material.dart';
import 'package:teams/domain/entities/chat.dart';

class ChatListItem extends StatelessWidget {
  const ChatListItem({super.key, required this.chat});

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(radius: 20),
      title: Text(chat.name),
    );
  }
}
