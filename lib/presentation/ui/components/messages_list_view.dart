import 'package:flutter/material.dart';
import 'package:teams/domain/entities/message.dart';
import 'package:teams/presentation/ui/components/message_list_item.dart';

class MessagesListView extends StatelessWidget {
  const MessagesListView(
      {super.key, required this.messages, required this.userId});

  final List<Message> messages;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return MessageListItem(message: messages[index], userId: userId);
      },
    );
  }
}
