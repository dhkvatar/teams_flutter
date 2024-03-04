import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:teams/core/usecases/usecase.dart';
import 'package:teams/domain/repositories/chat_repository.dart';

@injectable
class GetChatUpdatesStream
    implements UseCase<Stream<ChatUpdateStreamItem>, NoParams?> {
  GetChatUpdatesStream({required this.chatRepository});

  late final ChatRepository chatRepository;

  @override
  Stream<ChatUpdateStreamItem> call([NoParams? params]) {
    return chatRepository.chatUpdatesStream;
  }
}
