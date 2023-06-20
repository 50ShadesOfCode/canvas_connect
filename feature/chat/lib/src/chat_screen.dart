import 'package:chat/src/bloc/chat_bloc.dart';
import 'package:chat/src/chat_form.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChatBloc>(
      create: (BuildContext context) => ChatBloc(
        appLocator<ConnectUseCase>(),
        appLocator<SendMessageUseCase>(),
        appLocator<ListenForMessagesStreamUseCase>(),
      )..add(InitChatEvent()),
      child: ChatForm(),
    );
  }
}
