
// V11
import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  ButtonCard({super.key, required this.name, required this.icon});

  final String name;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 23,
        child: Icon(icon, size: 26, color: Colors.white),
        backgroundColor: const Color(0xFF25D366),
      ),
      title: Text(
        name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    );
  }
}
