import 'package:chat_app/CustomUI/ButtonCard.dart';
import 'package:chat_app/CustomUI/ContactCard.dart';
import 'package:chat_app/Model/ChatModel.dart';
import 'package:chat_app/Screens/CreateGroup.dart';
import 'package:flutter/material.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({super.key});

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts = [
      ChatModel(
        currentMessage: '',
        icon: '',
        time: '',
        isGroup: false,
        name: 'Vip',
        status: 'full Stack developer',
      ),
      ChatModel(
        currentMessage: '',
        icon: '',
        time: '',
        isGroup: false,
        name: 'JP',
        status: 'front end developer',
      ),
      ChatModel(
        currentMessage: '',
        icon: '',
        time: '',
        isGroup: false,
        name: 'Aman',
        status: 'Associate developer',
      ),
      ChatModel(
        currentMessage: '',
        icon: '',
        time: '',
        isGroup: false,
        name: 'Karan',
        status: 'Backend developer',
      ),
      ChatModel(
        currentMessage: '',
        icon: '',
        time: '',
        isGroup: false,
        name: 'Saurabh',
        status: 'developer',
      ),
      ChatModel(
        currentMessage: '',
        icon: '',
        time: '',
        isGroup: false,
        name: 'Anjani',
        status: 'full Stack developer',
      )
    ];
    return Scaffold(
        appBar: AppBar(
            title: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Contact',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                Text(
                  '256 contacts',
                  style: TextStyle(fontSize: 13),
                )
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 26,
                ),
              ),
              PopupMenuButton<String>(
                onSelected: (value) {
                  print(value);
                },
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem(
                      child: Text('Invite Friends'),
                      value: 'Invite Friends',
                    ),
                    const PopupMenuItem(
                      child: Text('Contacts'),
                      value: 'Contacts',
                    ),
                    const PopupMenuItem(
                      child: Text('Refresh'),
                      value: 'Refresh',
                    ),
                    const PopupMenuItem(
                      child: Text('Help'),
                      value: 'Help',
                    ),
                  ];
                },
              )
            ]),
        body: ListView.builder(
            itemCount: contacts.length + 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  CreateGroup()));
                    },
                    child: ButtonCard(icon: Icons.group, name: 'New Group'));
              } else if (index == 1) {
                return ButtonCard(icon: Icons.person_add, name: 'New Contact');
              }
              return ContactCard(contact: contacts[index - 2]);
            }));
  }
}
