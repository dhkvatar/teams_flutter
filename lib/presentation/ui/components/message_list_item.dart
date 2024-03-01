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
    final isMe = message.senderId == userId;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      leading: isMe ? null : const CircleAvatar(),
      title: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            // The sender display name
            if (!isMe)
              Text(
                message.senderId.substring(0, 5),
                style: Theme.of(context).textTheme.titleSmall,
              ),

            // The message bubble
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: isMe ? Colors.blue : Colors.grey,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Text(
                    message.message,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  _formatDateTime(message.sentTime),
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatTwoDigit(int value) {
    return value.toString().padLeft(2, '0');
  }

  String _getAmPm(DateTime dateTime) {
    return dateTime.hour < 12 ? 'AM' : 'PM';
  }

  String _formatDateTime(DateTime dateTime) {
    return '${_formatTwoDigit(dateTime.hour)}:${_formatTwoDigit(dateTime.minute)} ${_getAmPm(dateTime)}';
  }
}
