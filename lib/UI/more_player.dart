import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MorePage extends StatelessWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: false,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title: Text("More", style: Theme.of(context).textTheme.headline1),
        ),
        // ignore: prefer_const_constructors
        body: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(
                  text: 'Games',
                ),
                Tab(
                  text: 'Training',
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
