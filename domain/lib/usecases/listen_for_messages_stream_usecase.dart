import '../domain.dart';

class ListenForMessagesStreamUseCase
    extends StreamUseCase<NoParams, MessageModel> {
  final SocketRepository socketRepository;

  ListenForMessagesStreamUseCase({
    required this.socketRepository,
  });

  @override
  Stream<MessageModel> execute(NoParams input) {
    return socketRepository.listenForMessages();
  }
}
