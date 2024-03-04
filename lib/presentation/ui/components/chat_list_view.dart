import 'package:flutter/material.dart';
import 'package:teams/presentation/ui/components/chat_list_item.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key, required this.chatIds});

  final List<String> chatIds;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (ctx, index) {
        return ChatListItem(chatId: chatIds[index]);
      },
      separatorBuilder: (ctx, index) => const Divider(),
      itemCount: chatIds.length,
    );
  }
}
