import 'package:chat_app/CustomUI/CustomCard.dart';
import 'package:chat_app/Model/ChatModel.dart';
import 'package:chat_app/Screens/SelectContact.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.chatmodels});
  final List<ChatModel> chatmodels;
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const SelectContact()));
        },
        child: const Icon(Icons.chat),
      ),
      body: ListView.builder(
          itemCount: widget.chatmodels.length,
          itemBuilder: (context, index) => CustomCard(
                chatModel: widget.chatmodels[index],
              )),
    );
  }
}
