import 'package:chat_app/Model/ChatModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AvtarCard extends StatelessWidget {
  AvtarCard({super.key, required this.chatModel});
  final ChatModel chatModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 23,
              backgroundColor: Colors.blueGrey[200],
              child: SvgPicture.asset(
                'assets/icons/person.svg',
                // ignore: deprecated_member_use
                color: Colors.white,
                height: 30,
                width: 30,
              ),
            ),
            const Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                radius: 11,
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.clear,
                  color: Colors.white,
                  size: 13,
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          chatModel.name,
          style: const TextStyle(fontSize: 12),
        ),
      ]),
    );
  }
}
