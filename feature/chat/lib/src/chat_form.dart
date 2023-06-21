import 'package:chat/src/bloc/chat_bloc.dart';
import 'package:chat/src/widgets/message_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_ui/core_ui.dart';

class ChatForm extends StatefulWidget {
  const ChatForm({super.key});

  @override
  State<ChatForm> createState() => _ChatFormState();
}

class _ChatFormState extends State<ChatForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Canvas Connect"),
      ),
      body: BlocBuilder<ChatBloc, ChatState>(
        builder: (_, ChatState state) {
          return Stack(
            children: <Widget>[
              if (state.messages.isNotEmpty) ...[
                ListView.builder(
                  itemCount: state.messages.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(
                    top: AppDimens.PADDING_10,
                    bottom: AppDimens.PADDING_10,
                  ),
                  physics: const ScrollPhysics(),
                  itemBuilder: (_, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        top: AppDimens.PADDING_8,
                        bottom: AppDimens.PADDING_8,
                        left: AppDimens.PADDING_12,
                        right: AppDimens.PADDING_12,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(AppDimens.BORDER_RADIUS_10),
                          ),
                          border:
                              Border.all(color: AppColors.of(context).white),
                          color: AppColors.of(context).lightBlue,
                        ),
                        padding: const EdgeInsets.only(
                          left: AppDimens.PADDING_16,
                          right: AppDimens.PADDING_16,
                          top: AppDimens.PADDING_10,
                          bottom: AppDimens.PADDING_10,
                        ),
                        child: Text(
                          state.messages[index].data,
                          style: AppFonts.normal16,
                        ),
                      ),
                    );
                  },
                )
              ] else ...[
                const Center(
                  child: Text('No messages'),
                ),
              ],
              const MessageBar(),
            ],
          );
        },
      ),
    );
  }
}
