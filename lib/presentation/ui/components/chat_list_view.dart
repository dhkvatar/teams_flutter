import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:teams/core/constants/chat_constants.dart';
import 'package:teams/domain/entities/chat.dart';
import 'package:teams/presentation/blocs/chat/chat_bloc.dart';
import 'package:teams/presentation/blocs/chat/chat_event.dart';
import 'package:teams/presentation/blocs/chat/chat_state.dart';
import 'package:teams/presentation/ui/components/chat_list_item.dart';

class ChatListView extends StatefulWidget {
  const ChatListView(
      {super.key, required this.chatIds, required this.isGroupChat});

  final List<String> chatIds;
  final bool isGroupChat;

  @override
  State<ChatListView> createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  // Controller for scrolling and pagination of the list of chats.
  final PagingController<ChatsPagingState, Chat> _pagingController =
      PagingController(firstPageKey: const ChatsPagingState());

  // Subscription to ChatsPagingState stream exposed by ChatBloc.
  late StreamSubscription _blocChatListingSubscription;

  @override
  void initState() {
    final bloc = context.read<ChatBloc>();

    // New paging requests sent to the ChatBloc.
    _pagingController.addPageRequestListener((pageKey) {
      bloc.add(ChatGetChatsRequested(
        groupChats: widget.isGroupChat,
        beforeChatId: widget.isGroupChat
            ? pageKey.oldestGroupChatId
            : pageKey.oldestDirectChatId,
        beforeDateTime: widget.isGroupChat
            ? pageKey.oldestGroupChatDateTime
            : pageKey.oldestDirectChatUpdateTime,
        limit: ChatConstants.chatPageSize,
      ));
    });

    // Subscription on stream on ChatsPagingState computed by bloc to update
    // UI with new chats and the next paging state to be requested.
    _blocChatListingSubscription =
        bloc.chatsPagingStateStream.listen((chatsPagingState) {
      _pagingController.value = PagingState(
        nextPageKey: widget.isGroupChat
            ? (!chatsPagingState.isOldestGroupChat ? chatsPagingState : null)
            : (!chatsPagingState.isOldestDirectChat ? chatsPagingState : null),
        itemList: bloc.state.chatsById.values
            .where((chat) => chat.isGroupChat == widget.isGroupChat)
            .toList(),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<Chat>(
        animateTransitions: true,
        itemBuilder: (context, item, index) => ChatListItem(chatId: item.id),
      ),
    );
  }

  @override
  void dispose() {
    _blocChatListingSubscription.cancel();
    super.dispose();
  }
}
