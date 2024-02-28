import 'package:flutter/material.dart';
import 'package:teams/domain/entities/chat.dart';
import 'package:teams/presentation/ui/components/chat_list_item.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key, required this.chats});

  final List<Chat> chats;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (ctx, index) {
        return ChatListItem(chat: chats[index]);
      },
      separatorBuilder: (ctx, index) => const Divider(),
      itemCount: chats.length,
    );
  }
}
