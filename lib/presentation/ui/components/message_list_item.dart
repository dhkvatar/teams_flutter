import 'package:flutter/material.dart';
import 'package:teams/domain/entities/message.dart';

class MessageListItem extends StatelessWidget {
  const MessageListItem({
    super.key,
    required this.message,
    required this.userId,
  });

  final Message message;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: userId == message.senderId
          ? null
          : Row(
              children: [
                const CircleAvatar(radius: 20),
                Text(message.message),
              ],
            ),
      trailing: userId == message.senderId ? Text(message.message) : null,
    );
  }
}
