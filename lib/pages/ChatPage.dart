import 'package:chat_app/CustomUI/CustomCard.dart';
import 'package:chat_app/Model/ChatModel.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
      name: 'Vip',
      icon: 'person.svg',
      isGroup: false,
      time: '12:00',
      currentMessage: 'hiii how are you',
    ),
    ChatModel(
      name: 'CanteenBoyz',
      icon: 'person.svg',
      isGroup: true,
      time: '15:00',
      currentMessage: ' how are you',
    ),
    ChatModel(
      name: 'Karan',
      icon: 'person.svg',
      isGroup: false,
      time: '13:00',
      currentMessage: 'i am fine',
    ),
    ChatModel(
      name: 'Aman',
      icon: 'person.svg',
      isGroup: true,
      time: '12:40',
      currentMessage: 'hello',
    ),
    ChatModel(
      name: 'Shaqib',
      icon: 'person.svg',
      isGroup: false,
      time: '17:20',
      currentMessage: 'hiii how are you',
    ),
    ChatModel(
      name: 'JP',
      icon: 'person.svg',
      isGroup: false,
      time: '17:20',
      currentMessage: 'hiii how are you',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.chat),
      ),
      body: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) => CustomCard(
                chatModel: chats[index],
              )),
    );
  }
}
