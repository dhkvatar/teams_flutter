import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat.freezed.dart';

@freezed
class Chat with _$Chat {
  const factory Chat({
    // The unique identifier of the chat.
    required String id,

    // The Id's of the users in the chat.
    required List<String> userIds,

    // The name of the chat,
    required String name,

    // The time the chat was created.
    required DateTime createTime,

    // The last update time.
    required DateTime updateTime,

    // Whether this is a group chat.
    required bool isGroupChat,
  }) = _Chat;
}
