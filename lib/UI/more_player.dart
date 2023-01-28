import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class MorePage extends StatelessWidget {
  const MorePage({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: false,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text("More", style: Theme.of(context).textTheme.headline1),
      ),
      // ignore: prefer_const_constructors
      body: Center(
       
      ),
    );
  }
}

