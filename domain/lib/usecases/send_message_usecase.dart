import 'package:core/core.dart';
import '../domain.dart';

import 'usecase.dart';

class SendMessageUseCase extends FutureUseCase<Message, void> {
  final SocketRepository socketRepository;

  SendMessageUseCase({
    required this.socketRepository,
  });

  @override
  Future<void> execute(Message input) async {
    await socketRepository.sendMessage(input);
  }
}
