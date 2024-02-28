import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:teams/domain/entities/chat.dart';
import 'package:teams/presentation/flows/home_flow.dart';

class ChatListItem extends StatelessWidget {
  const ChatListItem({super.key, required this.chat});

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(HomeFlow.chatDetailsRoutePath(chat.id));
      },
      child: ListTile(
        leading: const CircleAvatar(radius: 20),
        title: Text(chat.name),
      ),
    );
  }
}
