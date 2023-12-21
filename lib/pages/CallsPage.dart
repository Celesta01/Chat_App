import 'package:flutter/material.dart';

class CallsPages extends StatefulWidget {
  const CallsPages({super.key});

  @override
  State<CallsPages> createState() => _CallsPagesState();
}

class _CallsPagesState extends State<CallsPages> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('Calls Page'),
    ));
  }
}
