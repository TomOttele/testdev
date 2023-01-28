import 'package:flutter/material.dart';
import 'package:testdev/UI/home_player1.dart';
import 'package:testdev/UI/Xrpe.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            children: [
          RPEPage(),
          HomeScreen(),
        ]));
  }
}
