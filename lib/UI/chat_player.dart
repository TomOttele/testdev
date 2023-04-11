import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  Future showToast(String message) async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text("Chats", style: Theme.of(context).textTheme.displayLarge),
      ),
      body: Column(
        children: const [],
      ),
    );
  }
}
