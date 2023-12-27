import 'package:chat_app/Model/ChatModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactCard extends StatelessWidget {
  ContactCard({super.key, required this.contact});
  final ChatModel contact;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: CircleAvatar(
          radius: 23,
          child: SvgPicture.asset(
            'assets/icons/person.svg',
            color: Colors.white,
            height: 30,
            width: 30,
          ),
          backgroundColor: Colors.blueGrey[200],
        ),
        title: Text(
          contact.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        subtitle: Text(
          contact.status!,
          style: TextStyle(fontSize: 13),
        ),
      ),
    );
  }
}
