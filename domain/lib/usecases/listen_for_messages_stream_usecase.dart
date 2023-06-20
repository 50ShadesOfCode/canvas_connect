import 'package:core/core.dart';

import '../domain.dart';
import 'usecase.dart';

class ListenForMessagesStreamUseCase extends StreamUseCase<NoParams, Message> {
  final SocketRepository socketRepository;

  ListenForMessagesStreamUseCase({
    required this.socketRepository,
  });

  @override
  Stream<Message> execute(NoParams input) {
    return socketRepository.listenForMessages();
  }
}
