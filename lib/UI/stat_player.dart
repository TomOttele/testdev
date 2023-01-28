import 'package:flutter/material.dart';
import 'package:testdev/UI/widgets/sortable_page.dart';

class StatPage extends StatelessWidget {
  const StatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: false,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title:
            Text("Player's name", style: Theme.of(context).textTheme.headline1),
      ),
      body: Center(
          child: Column(
        children: [SortablePage(), SizedBox()
      ])),
    );
  }
}
