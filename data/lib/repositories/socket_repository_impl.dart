import 'package:core/core.dart';
import 'package:domain/domain.dart';

import '../entities/message_entity.dart';
import '../mapper/mappers.dart';
import '../providers/socket_provider.dart';

class SocketRepositoryImpl implements SocketRepository {
  final SocketProvider socketProvider;

  SocketRepositoryImpl({
    required this.socketProvider,
  });

  @override
  Future<void> connect() async {
    await socketProvider.client.openStreamingConnection();
  }

  @override
  Stream<MessageModel> listenForMessages() async* {
    await for (final SerializableEntity update
        in socketProvider.client.canvasConnect.stream) {
      if (update is Message) {
        yield MessageMapper.mapToModel(MessageEntity.fromServerpod(update));
      }
    }
  }

  @override
  Future<void> sendMessage(MessageModel message) async {
    await socketProvider
        .sendMessage(MessageMapper.mapToEntity(message).toServerpod());
  }
}
