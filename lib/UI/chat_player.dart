import 'package:flutter/material.dart';
import 'package:testdev/UI/widgets/dropdown_button.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  Future showToast(String message) async {}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text("Chats", style: Theme.of(context).textTheme.displayLarge),
      ),
      body: Column(
        children: [
          DropDownMenu(
            items: const ['Present', 'Late', 'Absent'],
            labelText: 'Availability',
            width: size.width * 0.4,
            color: Colors.teal,
          ),
        ],
      ),
    );
  }
}
