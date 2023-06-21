import '../models/models.dart';

interface class SocketRepository {
  SocketRepository();

  Stream<MessageModel> listenForMessages() async* {}

  Future<void> sendMessage(MessageModel message) async {}

  Future<void> connect() async {}
}
