import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:teams/domain/entities/message.dart';
import 'package:teams/presentation/blocs/chat/chat_bloc.dart';
import 'package:teams/presentation/blocs/chat/chat_state.dart';

class MessageListItem extends StatelessWidget {
  const MessageListItem({
    super.key,
    required this.message,
    required this.userId,
    this.printTime = false,
  });

  final Message message;
  final String userId;
  final bool printTime;

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
              crossAxisAlignment:
                  isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
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
                Row(
                  mainAxisAlignment:
                      isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    // Message sent time
                    if (printTime)
                      Text(
                        DateFormat('hh:mm a').format(message.sentTime),
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      ),

                    // Pending message indicator
                    BlocBuilder<ChatBloc, ChatState>(
                      // buildWhen: (previous, current) =>
                      //     previous.messagesById[message.id] !=
                      //     current.messagesById[message.id],
                      builder: (ctx, state) {
                        if (isMe &&
                            message.uploadStatus ==
                                MessageUploadStatus.uploadInProgress) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            child: SizedBox(
                              width: 8,
                              height: 8,
                              child: CircularProgressIndicator(),
                            ),
                          );
                        } else if (isMe &&
                            message.uploadStatus ==
                                MessageUploadStatus.timeout) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Text(
                              'x',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.red,
                              ),
                            ),
                          );
                        }
                        return Container();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
