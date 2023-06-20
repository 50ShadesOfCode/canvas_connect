import 'package:core/core.dart';

abstract class SocketRepository {
  SocketRepository();

  Stream<Message> listenForMessages() async* {}

  Future<void> sendMessage(Message msg) async {}

  void connect() {}
}
