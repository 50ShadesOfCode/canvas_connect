import 'package:domain/domain.dart';

class ChatState {
  List<MessageModel> messages;

  ChatState({
    required this.messages,
  });

  ChatState copyWith(
    List<MessageModel> messages,
  ) {
    return ChatState(
      messages: messages,
    );
  }
}
