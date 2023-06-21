import 'package:canvas_connect_client/canvas_connect_client.dart';

class MessageEntity {
  final String data;

  MessageEntity({
    required this.data,
  });

  MessageEntity.fromServerpod(
    Message message,
  ) : data = message.data;

  Message toServerpod() {
    return Message(
      data: data,
    );
  }
}
