import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:teams/app/di/di.dart';
import 'package:teams/core/constants/chat_constants.dart';
import 'package:teams/domain/entities/message.dart';
import 'package:teams/domain/usecases/authentication/get_current_user.dart';
import 'package:teams/presentation/blocs/chat/chat_bloc.dart';
import 'package:teams/presentation/blocs/chat/chat_event.dart';
import 'package:teams/presentation/blocs/chat/chat_state.dart';
import 'package:teams/presentation/ui/components/message_list_item.dart';
import 'package:teams/presentation/ui/utils/date_time_utils.dart';

class ChatDetailsPage extends StatefulWidget {
  const ChatDetailsPage({super.key, required this.chatId});

  // The Id of the Chat the page displays.
  final String chatId;

  @override
  State<ChatDetailsPage> createState() => _ChatDetailsPageState();
}

class _ChatDetailsPageState extends State<ChatDetailsPage> {
  // The controller for message text input.
  final _chatInputController = TextEditingController();

  // Controller for scrolling and pagination of the list of messages.
  late final PagingController<MessagesPagingState, Message> _pagingController;

  // Subscription to MessagesPagingState stream exposed by ChatBloc.
  late StreamSubscription _blocMessagesPagingStateSubscription;

  @override
  void initState() {
    final bloc = context.read<ChatBloc>();
    _pagingController = PagingController(
        firstPageKey: MessagesPagingState(chatId: widget.chatId));
    _pagingController.addPageRequestListener((pageKey) {
      // New paging requests sent to the ChatBloc.
      bloc.add(ChatGetMessagesRequested(
        chatId: widget.chatId,
        beforeMessageId: pageKey.oldestMessageId,
        beforeDateTime: pageKey.oldestMessageSentTime,
        limit: ChatConstants.messagePageSize,
      ));
    });

    // Subscription on stream on MessagesPagingState computed by bloc to update
    // UI with new messages and the next paging state to be requested.
    _blocMessagesPagingStateSubscription =
        bloc.getMessagesPagingStateStreamForChat(widget.chatId).listen(
      (messagesPagingState) {
        final newItemList = messagesPagingState.messages.values.toList();
        newItemList.sort((a, b) => b.sentTime.compareTo(a.sentTime));
        _pagingController.value = PagingState(
          nextPageKey:
              messagesPagingState.isOldestMessage ? null : messagesPagingState,
          itemList: newItemList,
        );
      },
    );

    // Clear the chat textfield input.
    _chatInputController.clear();
    bloc.add(const ChatResetChatInputRequested());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('ChatDetailsPage: ${widget.chatId}'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // The list of messages.
            // _MessagesList(widget.chatId),
            Expanded(
              child: PagedListView(
                reverse: true,
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<Message>(
                  itemBuilder: (context, item, index) {
                    final numItems = _pagingController.itemList?.length ?? 0;
                    final nextDateTime = (index + 1 < numItems)
                        ? _pagingController.itemList![index + 1].sentTime
                        : null;
                    final prevDateTime = (index > 0)
                        ? _pagingController.itemList![index - 1].sentTime
                        : null;
                    return Column(
                      children: [
                        // The date of the message.
                        // Displays only once on the top for consecutive messages
                        // with the same date.
                        if ((index == numItems - 1) ||
                            (nextDateTime != null &&
                                getYMD(nextDateTime) != getYMD(item.sentTime)))
                          Text(DateFormat('EEEE, yyyy-MM-dd')
                              .format(item.sentTime)),

                        // The message.
                        MessageListItem(
                          message: item,
                          userId: getIt<GetCurrentUser>()()!.id,
                          printTime: prevDateTime == null ||
                              getYMDhm(prevDateTime) != getYMDhm(item.sentTime),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Bottom message input text field.
            _MessageInput(
              chatId: widget.chatId,
              chatInputController: _chatInputController,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _blocMessagesPagingStateSubscription.cancel();
    super.dispose();
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
