import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/chat_bloc.dart';

class MessageBar extends StatefulWidget {
  const MessageBar({super.key});

  @override
  State<MessageBar> createState() => _MessageBarState();
}

class _MessageBarState extends State<MessageBar> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        padding: const EdgeInsets.only(
          left: AppDimens.PADDING_16,
          bottom: AppDimens.PADDING_10,
          top: AppDimens.PADDING_10,
        ),
        height: AppDimens.messageBarHeight,
        width: double.infinity,
        color: AppColors.of(context).white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter message..",
                  hintStyle: AppFonts.normal14,
                  border: InputBorder.none,
                ),
                controller: _messageController,
              ),
            ),
            const SizedBox(
              width: AppDimens.sendButtonSpacing,
            ),
            FloatingActionButton(
              onPressed: () {
                BlocProvider.of<ChatBloc>(context).add(
                  SendMessageEvent(
                    message: _messageController.text,
                  ),
                );
              },
              backgroundColor: AppColors.of(context).lightBlue,
              elevation: AppDimens.ELEVATION_0,
              child: const Icon(
                Icons.send,
                color: Colors.white,
                size: AppDimens.sendIconSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
