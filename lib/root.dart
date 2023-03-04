import 'package:flutter/material.dart';

import 'package:testdev/UI/chat_player.dart';
import 'package:testdev/UI/home_player.dart';
import 'package:testdev/UI/more_player.dart';

import 'package:testdev/UI/stat_player.dart';
import 'package:testdev/UI/wallet_player.dart';
import 'package:testdev/UI/widgets/scroll_to_hide_widget.dart';

class RootWidget extends StatefulWidget {
  const RootWidget({super.key});

  @override
  State<RootWidget> createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  late ScrollController controller;

  void iniState() {
    super.initState();
    controller = ScrollController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  int _currentIndex = 0;
  List<Widget> body = const [
    Icon(Icons.wallet),
    Icon(Icons.chat),
    Icon(Icons.assessment),
    Icon(Icons.menu),
    Icon(Icons.home),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: _currentIndex,
            children: [
              HomePage(),
              WalletPage(),
              ChatPage(),
              PlayerStat(),
              MorePage()
            ],
          ),
          Align(
            alignment: const Alignment(0, 1),
            child: Padding(
              padding: const EdgeInsets.only(left: 45, right: 45, bottom: 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                // child: ScrollToHideWidget(
                // controller: controller,
                child: BottomNavigationBar(
                  backgroundColor: Theme.of(context).bottomAppBarTheme.color,
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  elevation: 0,
                  showUnselectedLabels: false,
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  currentIndex: _currentIndex,
                  unselectedItemColor: Colors.grey,
                  selectedItemColor: Colors.white,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.savings),
                      label: 'Wallet',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.chat),
                      label: 'Chat',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.assessment),
                      label: 'Stat',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.menu),
                      label: 'More',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
