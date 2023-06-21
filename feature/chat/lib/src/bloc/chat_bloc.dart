import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chat_event.dart';
import 'chat_state.dart';

export 'chat_event.dart';
export 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ConnectUseCase _connectUseCase;
  final SendMessageUseCase _sendMessageUseCase;
  final ListenForMessagesStreamUseCase _listenForMessagesStreamUseCase;

  ChatBloc({
    required ConnectUseCase connectUseCase,
    required SendMessageUseCase sendMessageUseCase,
    required ListenForMessagesStreamUseCase listenForMessagesStreamUseCase,
  })  : _connectUseCase = connectUseCase,
        _sendMessageUseCase = sendMessageUseCase,
        _listenForMessagesStreamUseCase = listenForMessagesStreamUseCase,
        super(
          ChatState(
            messages: List.empty(growable: true),
          ),
        ) {
    on<InitChatEvent>(_onInitChatEvent);
    on<SendMessageEvent>(_onSendMessageEvent);
    on<MessageAddEvent>(_onMessageAddEvent);

    add(InitChatEvent());
  }

  Future<void> _onInitChatEvent(
    InitChatEvent event,
    Emitter<ChatState> emit,
  ) async {
    _connectUseCase.execute(const NoParams());
    Stream<MessageModel> messageStream =
        _listenForMessagesStreamUseCase.execute(
      const NoParams(),
    );
    messageStream.listen((event) {
      add(MessageAddEvent(message: event));
    });
  }

  Future<void> _onMessageAddEvent(
    MessageAddEvent event,
    Emitter<ChatState> emit,
  ) async {
    List<MessageModel> messages = List.of(state.messages);
    messages.add(event.message);
    emit(ChatState(messages: messages));
  }

  Future<void> _onSendMessageEvent(
    SendMessageEvent event,
    Emitter<ChatState> emit,
  ) async {
    _sendMessageUseCase.execute(MessageModel(data: event.message));
  }
}
