import 'package:chat_app/Model/ChatModel.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard({super.key, required this.chatModel});
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
      ),
      title: Text(
        chatModel.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      subtitle: Row(
        children: [
          Icon(Icons.done_all),
          SizedBox(width: 3),
          Text(
            chatModel.currentMessage,
            style: TextStyle(fontSize: 13),
          ),
        ],
      ),
      trailing: Text(chatModel.time),
    );
  }
}
