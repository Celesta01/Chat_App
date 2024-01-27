import 'package:chat_app/CustomUI/ButtonCard.dart';
import 'package:chat_app/Model/ChatModel.dart';
import 'package:chat_app/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late ChatModel sourceChat;

  List<ChatModel> chatModels = [
    ChatModel(
        name: 'Vip',
        icon: 'person.svg',
        isGroup: false,
        time: '12:00',
        currentMessage: 'hiii how are you',
        id: 1),
    ChatModel(
        name: 'CanteenBoyz',
        icon: 'person.svg',
        isGroup: false,
        time: '15:00',
        currentMessage: ' how are you',
        id: 2),
    ChatModel(
        name: 'Karan',
        icon: 'person.svg',
        isGroup: false,
        time: '13:00',
        currentMessage: 'i am fine',
        id: 3),
    ChatModel(
        name: 'Aman',
        icon: 'person.svg',
        isGroup: false,
        time: '12:40',
        currentMessage: 'hello',
        id: 4),
    ChatModel(
        name: 'Shaqib',
        icon: 'person.svg',
        isGroup: false,
        time: '17:20',
        currentMessage: 'hiii how are you',
        id: 5),
    ChatModel(
        name: 'JP',
        icon: 'person.svg',
        isGroup: false,
        time: '17:20',
        currentMessage: 'hiii how are you',
        id: 6),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chatModels.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              sourceChat = chatModels.removeAt(index);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return HomeScreen(
                  chatmodels: chatModels,
                  sourcechat: sourceChat,
                );
              }));
            },
            child: ButtonCard(
              name: chatModels[index].name,
              icon: Icons.person,
            ),
          );
        },
      ),
    );
  }
}
