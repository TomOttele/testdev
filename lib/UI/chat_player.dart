import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text("Chats", style: Theme.of(context).textTheme.headline1),
      ),
      // ignore: unnecessary_new
      body: new Center(
        child: InkWell(
            child: Text('Open Browser'),
            // ignore: deprecated_member_use
            onTap: () => launch(
                'https://docs.flutter.io/flutter/services/UrlLauncher-class.html')),
      ),
    );
  }
}
