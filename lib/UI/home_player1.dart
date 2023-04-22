import 'package:flutter/material.dart';
import 'dart:io';
import 'package:testdev/UI/widgets/avatar_round_route.dart';
import 'package:testdev/UI/widgets/calendar_preview.dart';
import 'package:testdev/UI/widgets/separator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
          style: themeData.textTheme.displayLarge,
        ),
        actions: <Widget>[
          AvatarRoundR(
            onTap: () {
              return {
                Navigator.of(context).pushNamed("/SettingPage"),
              };
            },
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
              Separator(),
              CalendarPreview(
                day: 'Today',
                time: '17:30',
              )
            ],
          ),
        ),
      ),
    );
  }
}
