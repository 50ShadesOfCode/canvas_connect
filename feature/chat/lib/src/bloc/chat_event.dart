import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class ChatEvent {}

class InitChatEvent extends ChatEvent {}

class SendMessageEvent extends ChatEvent {
  final String message;

  SendMessageEvent({
    required this.message,
  });
}

class MessageAddEvent extends ChatEvent {
  final MessageModel message;

  MessageAddEvent({
    required this.message,
  });
}
