import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:teams/presentation/blocs/chat/chat_bloc.dart';
import 'package:teams/presentation/blocs/chat/chat_event.dart';
import 'package:teams/presentation/flows/home_flow.dart';

class ChatListItem extends StatelessWidget {
  const ChatListItem({super.key, required this.chatId});

  final String chatId;

  @override
  Widget build(BuildContext context) {
    final chatBloc = context.read<ChatBloc>();
    final chat = chatBloc.state.chatsById[chatId];
    return GestureDetector(
      onTap: () {
        // Load latest messages only on first access to chat.
        if (chatBloc.state.lastChatAccess[chatId] == null) {
          chatBloc.add(ChatGetMessagesRequested(chatId: chatId));
        }
        context.go(HomeFlow.chatDetailsRoutePath(chatId));
      },
      child: ListTile(
        leading: const CircleAvatar(radius: 20),
        title: Text(chat!.name),
        trailing: Text(chat.updateTime.toString()),
      ),
    );
  }
}
