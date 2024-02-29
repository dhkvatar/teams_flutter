import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:teams/domain/entities/chat.dart';
import 'package:teams/presentation/blocs/chat/chat_bloc.dart';
import 'package:teams/presentation/blocs/chat/chat_event.dart';
import 'package:teams/presentation/flows/home_flow.dart';

class ChatListItem extends StatelessWidget {
  const ChatListItem({super.key, required this.chat});

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    final chatBloc = context.read<ChatBloc>();
    return GestureDetector(
      onTap: () {
        if (chatBloc.state.lastChatAccess[chat.id] == null) {
          chatBloc.add(ChatGetMessagesRequested(chatId: chat.id));
        }
        context.go(HomeFlow.chatDetailsRoutePath(chat.id));
      },
      child: ListTile(
        leading: const CircleAvatar(radius: 20),
        title: Text(chat.name),
        trailing: Text(chat.updateTime.toString()),
      ),
    );
  }
}
