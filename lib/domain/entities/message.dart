import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';

@freezed
class Message with _$Message {
  const factory Message({
    // The unique identifier of the message.
    required String id,

    // The user Id of the sender.
    required String senderId,

    // The Id of the Chat this message belongs to.
    required String chatId,

    // The message.
    required String message,

    // The time the message was sent.
    required DateTime sentTime,

    // The upload status of the message.
    @Default(MessageUploadStatus.success) MessageUploadStatus uploadStatus,
  }) = _Message;
}

enum MessageUploadStatus {
  uploadInProgress,
  timeout,
  success,
}
