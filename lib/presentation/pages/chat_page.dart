import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teams/presentation/blocs/chat/chat_bloc.dart';
import 'package:teams/presentation/blocs/chat/chat_state.dart';
import 'package:teams/presentation/ui/components/chat_list_view.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: AppBar(
            bottom: const TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(text: 'DM'),
                Tab(text: 'Group Messages'),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            _DirectChatsTab(),
            _GroupChatsTab(),
          ],
        ),
      ),
    );
  }
}

class _GroupChatsTab extends StatelessWidget {
  const _GroupChatsTab();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (ctx, state) => ChatListView(chats: state.groupChats),
    );
  }
}

class _DirectChatsTab extends StatelessWidget {
  const _DirectChatsTab();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (ctx, state) => ChatListView(chats: state.directMessageChats),
    );
  }
}
