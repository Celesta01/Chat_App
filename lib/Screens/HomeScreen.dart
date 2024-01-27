import 'package:chat_app/Model/ChatModel.dart';
import 'package:chat_app/pages/CallsPage.dart';
import 'package:chat_app/pages/CameraPage.dart';
import 'package:chat_app/pages/ChatPage.dart';
import 'package:chat_app/pages/StatusPage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, required this.chatmodels, required this.sourcechat});
  final List<ChatModel> chatmodels;
  final ChatModel sourcechat;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat App'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          // IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  child: Text('New Group'),
                  value: 'New Group',
                ),
                const PopupMenuItem(
                  child: Text('New Broadcast'),
                  value: 'New Broadcast',
                ),
                const PopupMenuItem(
                  child: Text('Whatsapp Web'),
                  value: 'Whatsapp Web',
                ),
                const PopupMenuItem(
                  child: Text('Starred Messages'),
                  value: 'Starred Messages',
                ),
                const PopupMenuItem(
                  child: Text('Settings'),
                  value: 'Settings',
                ),
              ];
            },
          )
        ],
        bottom: TabBar(
            controller: _controller,
            indicatorColor: Colors.white,
            tabs: const [
              Tab(
                icon: Icon(Icons.camera_alt),
              ),
              Tab(
                text: 'CHATS',
              ),
              Tab(
                text: 'STATUS',
              ),
              Tab(
                text: 'CALLS',
              )
            ]),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          const CameraPage(),
          ChatPage(
            chatmodels: widget.chatmodels,
            sourcchat: widget.sourcechat,
          ),
          const StatusPage(),
          const CallsPages(),
        ],
      ),
    );
  }
}
