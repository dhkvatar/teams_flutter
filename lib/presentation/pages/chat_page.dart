import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teams/presentation/blocs/chat/chat_bloc.dart';

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
        body: TabBarView(
          children: [
            Column(
              children: [
                const Icon(Icons.wind_power),
                Text('${context.read<ChatBloc>().state.chatsLoadingStatus}'),
                Text(
                    '${context.read<ChatBloc>().state.directMessageChats.length}'),
              ],
            ),
            const Icon(Icons.document_scanner),
          ],
        ),
      ),
    );
  }
}
