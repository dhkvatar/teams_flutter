import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teams/app/di/di.dart';
import 'package:teams/domain/usecases/authentication/get_current_user.dart';
import 'package:teams/presentation/blocs/chat/chat_bloc.dart';
import 'package:teams/presentation/blocs/chat/chat_event.dart';
import 'package:teams/presentation/blocs/chat/chat_state.dart';
import 'package:teams/presentation/ui/components/message_list_item.dart';

class ChatDetailsPage extends StatelessWidget {
  ChatDetailsPage({super.key, required this.chatId});

  final String chatId;
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
            _MessagesList(chatId),
            const SizedBox(height: 10),

            // Bottom chat input
            _ChatInput(
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
        final messagesByDate =
            context.read<ChatBloc>().state.chatMessagesByDate[chatId] ?? {};

        if (state.messagesLoadingStatus == MessagesLoadingStatus.inProgress) {
          return const CircularProgressIndicator();
        }

        final dateKeys = messagesByDate.keys.toList();
        dateKeys.sort((a, b) => b.compareTo(a));

        return Expanded(
          child: ListView.builder(
            reverse: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (ctx, index) {
              // final dateKey = state.sortedDates[chatId]!.elementAt(index);
              final dateKey = dateKeys.elementAt(index);
              return Column(
                children: [
                  Text(dateKey.toString()),
                  Column(
                    children: messagesByDate[dateKey]!.map((messageId) {
                      return MessageListItem(
                        message: state.messagesById[messageId]!,
                        userId: getIt<GetCurrentUser>()()!.id,
                      );
                    }).toList(),
                  )
                ],
              );
            },
            itemCount: messagesByDate.length,
          ),
        );
      },
    );
  }
}

class _ChatInput extends StatelessWidget {
  const _ChatInput({
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
