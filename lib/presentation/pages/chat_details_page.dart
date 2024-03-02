import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teams/app/di/di.dart';
import 'package:teams/domain/usecases/authentication/get_current_user.dart';
import 'package:teams/presentation/blocs/chat/chat_bloc.dart';
import 'package:teams/presentation/blocs/chat/chat_state.dart';
import 'package:teams/presentation/ui/components/message_list_item.dart';

class ChatDetailsPage extends StatelessWidget {
  const ChatDetailsPage({super.key, required this.chatId});

  final String chatId;

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
            const _ChatInput(),
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
        // final messages =
        //     context.read<ChatBloc>().state.chatMessages[chatId] ?? [];
        final messagesByDate =
            context.read<ChatBloc>().state.chatMessagesByDate[chatId] ?? {};
        if (state.messagesLoadingStatus == MessagesLoadingStatus.inProgress) {
          return const CircularProgressIndicator();
        }
        return Expanded(
          child: ListView.builder(
            reverse: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (ctx, index) {
              final dateKey = state.sortedDates[chatId]!.elementAt(index);
              return Column(
                children: [
                  Text(dateKey.toString()),
                  Column(
                    children: messagesByDate[dateKey]!.map((e) {
                      return MessageListItem(
                        message: e,
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
  const _ChatInput();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
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
            ),
          ),
          const SizedBox(width: 5),
          const IconButton(onPressed: null, icon: Icon(Icons.send)),
        ],
      ),
    );
  }
}
