import 'package:flutter/material.dart';
import 'dart:io';

import 'package:testdev/UI/widgets/elevatedbutton.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? image;
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: false,
        backgroundColor: themeData.appBarTheme.backgroundColor,
        title: Text(
          "New activity",
          style: themeData.textTheme.headline1,
        ),
        actions: <Widget>[
          CircleAvatar(
            maxRadius: 25,
            backgroundImage: image != null
                ? FileImage(image!) as ImageProvider
                : const AssetImage('assets/images/cristiano_ronaldo.webp'),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("/SettingPage");
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text('Dreh den Swag auf'),
            ],
          ),
        ),
      ),
    );
  }
}
