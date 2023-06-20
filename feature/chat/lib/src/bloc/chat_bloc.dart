import 'package:domain/domain.dart';
import 'package:domain/usecases/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/core.dart';

import 'chat_event.dart';
import 'chat_state.dart';

export 'chat_event.dart';
export 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ConnectUseCase _connectUseCase;
  final SendMessageUseCase _sendMessageUseCase;
  final ListenForMessagesStreamUseCase _listenForMessagesStreamUseCase;

  ChatBloc(
    ConnectUseCase connectUseCase,
    SendMessageUseCase sendMessageUseCase,
    ListenForMessagesStreamUseCase listenForMessagesStreamUseCase,
  )   : _connectUseCase = connectUseCase,
        _sendMessageUseCase = sendMessageUseCase,
        _listenForMessagesStreamUseCase = listenForMessagesStreamUseCase,
        super(ChatState(messages: List.empty(growable: true))) {
    on<InitChatEvent>(_onInitChatEvent);
    on<SendMessageEvent>(_onSendMessageEvent);
    on<MessageAddEvent>(_onMessageAddEvent);
  }

  Future<void> _onInitChatEvent(
      InitChatEvent event, Emitter<ChatState> emit) async {
    _connectUseCase.execute(const NoParams());
    Stream<Message> messageStream =
        _listenForMessagesStreamUseCase.execute(const NoParams());
    messageStream.listen((event) {
      add(MessageAddEvent(message: event));
    });
    emit(state);
  }

  Future<void> _onMessageAddEvent(
      MessageAddEvent event, Emitter<ChatState> emit) async {
    state.messages.add(event.message);
    emit(ChatState(messages: state.messages));
  }

  Future<void> _onSendMessageEvent(
      SendMessageEvent event, Emitter<ChatState> emit) async {
    _sendMessageUseCase.execute(Message(data: event.message));
    emit(state);
  }
}
