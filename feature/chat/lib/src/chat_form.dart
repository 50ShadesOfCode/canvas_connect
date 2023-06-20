import 'package:chat/src/bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatForm extends StatefulWidget {
  @override
  State<ChatForm> createState() => _ChatFormState();
}

class _ChatFormState extends State<ChatForm> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Canvas Connect"),
      ),
      body: BlocBuilder<ChatBloc, ChatState>(
        builder: (BuildContext context, ChatState state) {
          print(state.messages.isNotEmpty);
          return Stack(
            children: [
              state.messages.isNotEmpty
                  ? ListView.builder(
                      itemCount: state.messages.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      physics: const ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                            bottom: 8,
                            left: 12,
                            right: 12,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              border: Border.all(color: Colors.white60),
                              color: Colors.lightBlue,
                            ),
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 10, bottom: 10),
                            child: Text(
                              state.messages[index].data,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.white),
                            ),
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: Text('No messages'),
                    ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 16,
                    bottom: 10,
                    top: 10,
                  ),
                  height: 60,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: "Enter message..",
                            hintStyle: TextStyle(color: Colors.black54),
                            border: InputBorder.none,
                          ),
                          controller: _messageController,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          BlocProvider.of<ChatBloc>(context).add(
                            SendMessageEvent(message: _messageController.text),
                          );
                        },
                        backgroundColor: Colors.blue,
                        elevation: 0,
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
