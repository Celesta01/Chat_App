import 'package:chat_app/CustomUI/AvtarCard.dart';
import 'package:chat_app/CustomUI/ContactCard.dart';
import 'package:chat_app/Model/ChatModel.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  CreateGroup({super.key});

  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel> contacts = [
    ChatModel(
        name: "Vip",
        status: "A full stack developer",
        icon: '',
        isGroup: false,
        time: '',
        currentMessage: ''),
    ChatModel(
        name: "Aman",
        status: "Flutter Developer...........",
        icon: '',
        isGroup: false,
        time: '',
        currentMessage: ''),
    ChatModel(
        name: "Karan",
        status: "Web developer...",
        icon: '',
        isGroup: false,
        time: '',
        currentMessage: ''),
    ChatModel(
        name: "Saurabh",
        status: "App developer....",
        icon: '',
        isGroup: false,
        time: '',
        currentMessage: ''),
    ChatModel(
        name: "Rohit",
        status: "Raect developer..",
        icon: '',
        isGroup: false,
        time: '',
        currentMessage: ''),
    ChatModel(
        name: "Jp",
        status: "Full Stack Web",
        icon: '',
        isGroup: false,
        time: '',
        currentMessage: ''),
    ChatModel(
        name: "Shaqib",
        status: "Example work",
        icon: '',
        isGroup: false,
        time: '',
        currentMessage: ''),
    ChatModel(
        name: "Shankar",
        status: "Sharing is caring",
        icon: '',
        isGroup: false,
        time: '',
        currentMessage: ''),
    ChatModel(
        name: "Anjani",
        status: ".....",
        icon: '',
        isGroup: false,
        time: '',
        currentMessage: ''),
    ChatModel(
        name: "Suraj",
        status: "Love you Mom Dad",
        icon: '',
        isGroup: false,
        time: '',
        currentMessage: ''),
    ChatModel(
        name: "Tester",
        status: "I find the bugs",
        icon: '',
        isGroup: false,
        time: '',
        currentMessage: ''),
  ];
  List<ChatModel> groupmember = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "New Group",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Add participants",
                style: TextStyle(
                  fontSize: 13,
                ),
              )
            ],
          ),
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.search,
                  size: 26,
                ),
                onPressed: () {}),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xFF128C7E),
            onPressed: () {},
            child: const Icon(Icons.arrow_forward)),
        body: Stack(
          children: [
            ListView.builder(
                itemCount: contacts.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      height: groupmember.isNotEmpty ? 90 : 10,
                    );
                  }
                  return InkWell(
                    onTap: () {
                      setState(() {
                        if (contacts[index - 1].select == true) {
                          groupmember.remove(contacts[index - 1]);
                          contacts[index - 1].select = false;
                        } else {
                          groupmember.add(contacts[index - 1]);
                          contacts[index - 1].select = true;
                        }
                      });
                    },
                    child: ContactCard(
                      contact: contacts[index - 1],
                    ),
                  );
                }),
            groupmember.isNotEmpty
                ? Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Container(
                          height: 75,
                          color: Colors.white,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: contacts.length,
                              itemBuilder: (context, index) {
                                if (contacts[index].select == true)
                                  // ignore: curly_braces_in_flow_control_structures
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        groupmember.remove(contacts[index]);
                                        contacts[index].select = false;
                                      });
                                    },
                                    child: AvtarCard(
                                      chatModel: contacts[index],
                                    ),
                                  );
                                return Container();
                              }),
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                      ],
                    ),
                  )
                : Container(),
          ],
        ));
  }
}
