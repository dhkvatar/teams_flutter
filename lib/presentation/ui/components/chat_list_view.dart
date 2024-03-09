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
  final PagingController<ChatsPagingState, Chat> _pagingController =
      PagingController(firstPageKey: const ChatsPagingState());
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
    // Subscription on stream on list of chats loaded.
    _blocChatListingSubscription =
        bloc.chatListingsStream.listen((chatsPagingState) {
      // final chats = chatsListing
      //     .where((chat) => chat.isGroupChat == widget.isGroupChat)
      //     .toList();
      // chats.sort((a, b) => b.updateTime.compareTo(a.updateTime));
      // final oldestChat = chats.isNotEmpty ? chats.last : null;

      _pagingController.value = PagingState(
        nextPageKey: widget.isGroupChat
            ? (!chatsPagingState.isOldestGroupChat ? chatsPagingState : null)
            : (!chatsPagingState.isOldestDirectChat ? chatsPagingState : null),
        // widget.isGroupChat
        //     ? bloc.state.chatsPagingState.copyWith(
        //         oldestGroupChatId: chatsPagingState.oldestGroupChatId,
        //         oldestGroupChatDateTime: oldestChat?.updateTime,
        //         isOldestGroupChat:
        //       )
        //     : bloc.state.chatsPagingState.copyWith(
        //         oldestDirectChatId: oldestChat?.id,
        //         oldestDirectChatUpdateTime: oldestChat?.updateTime,
        //       ),
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
