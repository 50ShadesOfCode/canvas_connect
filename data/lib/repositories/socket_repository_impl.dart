import 'package:core/core.dart';
import 'package:domain/domain.dart';

import '../providers/socket_provider.dart';

class SocketRepositoryImpl extends SocketRepository {
  final SocketProvider socketProvider;
  StreamingConnectionHandler? connectionHandler;

  SocketRepositoryImpl({
    required this.socketProvider,
  });

  @override
  void connect() {
    socketProvider.client.openStreamingConnection();
  }

  @override
  Stream<Message> listenForMessages() async* {
    await for (final SerializableEntity update
        in socketProvider.client.canvasConnect.stream) {
      if (update is Message) {
        yield update;
      }
    }
  }

  @override
  Future<void> sendMessage(Message msg) async {
    await socketProvider.sendMessage(msg);
  }
}
