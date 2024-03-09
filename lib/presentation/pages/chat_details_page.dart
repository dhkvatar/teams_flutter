import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:teams/app/di/di.dart';
import 'package:teams/domain/usecases/authentication/get_current_user.dart';
import 'package:teams/presentation/blocs/chat/chat_bloc.dart';
import 'package:teams/presentation/blocs/chat/chat_event.dart';
import 'package:teams/presentation/blocs/chat/chat_state.dart';
import 'package:teams/presentation/ui/components/message_list_item.dart';
import 'package:teams/presentation/ui/utils/date_time_utils.dart';

class ChatDetailsPage extends StatelessWidget {
  ChatDetailsPage({super.key, required this.chatId});

  // The Id of the Chat the page displays.
  final String chatId;

  // The controller for message text input.
  final _chatInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('ChatDetailsPage: $chatId'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // The list of messages.
            _MessagesList(chatId),
            const SizedBox(height: 10),

            // Bottom message input text field.
            _MessageInput(
              chatId: chatId,
              chatInputController: _chatInputController,
            ),
          ],
        ),
      ),
    );
  }
}

class _MessagesList extends StatelessWidget {
  const _MessagesList(this.chatId);

  final String chatId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (ctx, state) {
        final messagesByDateTime =
            context.read<ChatBloc>().state.chatMessagesByDateTime[chatId] ?? {};

        if (state.messagesLoadingStatus == MessagesLoadingStatus.inProgress) {
          return const CircularProgressIndicator();
        }
        // Get all dates for messages
        final dateKeys =
            Set.from(messagesByDateTime.keys.map((dt) => getYMD(dt))).toList();
        dateKeys.sort((a, b) => b.compareTo(a));
        // Get all keys of messagesByDateTime grouped by dates
        final timeKeysByDate = {
          for (var dateKey in dateKeys)
            dateKey: messagesByDateTime.keys
                .where((dt) => getYMD(dt) == dateKey)
                .toList(),
        };
        for (var timeKeys in timeKeysByDate.values) {
          timeKeys.sort((a, b) => b.compareTo(a));
        }

        return Expanded(
          // Messages grouped by date
          child: ListView.builder(
            reverse: true,
            itemBuilder: (ctx, dateIndex) {
              final dateKey = dateKeys.elementAt(dateIndex);
              final timeKeys = timeKeysByDate[dateKey] ?? [];
              return Column(
                children: [
                  Text(DateFormat('EEEE, yyyy-MM-dd').format(dateKey)),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (ctx, timeIndex) {
                      final timeKey = timeKeys.elementAt(timeIndex);
                      return Column(
                        children: messagesByDateTime[timeKey]!.map((messageId) {
                          return MessageListItem(
                              message: state.messagesById[messageId]!,
                              userId: getIt<GetCurrentUser>()()!.id,
                              printTime: messageId ==
                                  messagesByDateTime[timeKey]!.last);
                        }).toList(),
                      );
                    },
                    itemCount: timeKeys.length,
                  ),
                ],
              );
            },
            itemCount: dateKeys.length,
          ),
        );
      },
    );
  }
}

class _MessageInput extends StatelessWidget {
  const _MessageInput({
    required this.chatId,
    required this.chatInputController,
  });

  final String chatId;
  final TextEditingController chatInputController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: chatInputController,
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 5,
              style: const TextStyle(height: 1.0),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                hintText: 'Type message',
              ),
              onChanged: (input) {
                context
                    .read<ChatBloc>()
                    .add(ChatMessageInputChanged(message: input));
              },
            ),
          ),
          const SizedBox(width: 5),
          BlocBuilder<ChatBloc, ChatState>(
            builder: (ctx, state) => IconButton(
              onPressed: state.isValid
                  ? () {
                      context.read<ChatBloc>().add(ChatSendMessageRequested(
                          chatId: chatId, message: chatInputController.text));
                      chatInputController.clear();
                    }
                  : null,
              icon: const Icon(Icons.send),
            ),
          ),
        ],
      ),
    );
  }
}
