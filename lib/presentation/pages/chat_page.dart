import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teams/presentation/blocs/chat/chat_bloc.dart';
import 'package:teams/presentation/blocs/chat/chat_state.dart';
import 'package:teams/presentation/ui/components/chat_list_view.dart';
import 'package:teams/presentation/ui/components/home_app_bar.dart';
import 'package:teams/presentation/ui/components/home_bottom_navigation_bar.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: HomeAppBar(
            bottom: TabBar(
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
        bottomNavigationBar: HomeBottomNavigationBar(),
      ),
    );
  }
}

class _GroupChatsTab extends StatelessWidget {
  const _GroupChatsTab();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (ctx, state) => ChatListView(
        chatIds: state.groupChats,
      ),
    );
  }
}

class _DirectChatsTab extends StatelessWidget {
  const _DirectChatsTab();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (ctx, state) {
        return state.chatsLoadingStatus == ChatsLoadingStatus.inProgress
            ? const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              )
            : ChatListView(chatIds: state.directMessageChats);
      },
    );
  }
}
