import 'package:chat_app/Model/ChatModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IndividualPage extends StatefulWidget {
  IndividualPage({super.key, required this.chatModel});
  ChatModel chatModel;

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(
              Icons.arrow_back,
              size: 24,
            ),
            CircleAvatar(
              child: SvgPicture.asset(
                widget.chatModel.isGroup
                    ? 'assets/icons/groups.svg'
                    : 'assets/icons/person.svg',
                color: Colors.white,
                height: 37,
                width: 37,
              ),
              backgroundColor: Colors.blueGrey,
              radius: 20,
            ),
          ]),
        ),
        title: Column(children: [
          Text(widget.chatModel.name,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.5))
        ]),
      ),
    );
  }
}
