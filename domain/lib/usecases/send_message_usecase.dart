import '../domain.dart';

class SendMessageUseCase extends FutureUseCase<MessageModel, void> {
  final SocketRepository socketRepository;

  SendMessageUseCase({
    required this.socketRepository,
  });

  @override
  Future<void> execute(MessageModel input) async {
    await socketRepository.sendMessage(input);
  }
}
