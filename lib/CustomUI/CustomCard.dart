import 'package:chat_app/Model/ChatModel.dart';
import 'package:chat_app/Screens/IndividualPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatelessWidget {
  CustomCard({super.key, required this.chatModel, required this.sourcechat});
  final ChatModel chatModel;

  final ChatModel sourcechat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => IndividualPage(
                        chatModel: chatModel,
                        sourcechat: sourcechat,
                      )));
        },
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                child: SvgPicture.asset(
                  chatModel.isGroup
                      ? 'assets/icons/groups.svg'
                      : 'assets/icons/person.svg',
                  color: Colors.white,
                  height: 37,
                  width: 37,
                ),
                backgroundColor: Colors.blueGrey,
                radius: 30,
              ),
              title: Text(
                chatModel.name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Row(
                children: [
                  const Icon(Icons.done_all),
                  const SizedBox(width: 3),
                  Text(
                    chatModel.currentMessage,
                    style: const TextStyle(fontSize: 13),
                  ),
                ],
              ),
              trailing: Text(chatModel.time),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20, left: 80.0),
              child: Divider(
                thickness: 1,
              ),
            )
          ],
        ));
  }
}
