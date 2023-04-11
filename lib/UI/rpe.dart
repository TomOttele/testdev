import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testdev/application/theme_Service.dart';

class RPEPage extends StatefulWidget {
  const RPEPage({super.key});

  @override
  State<RPEPage> createState() => _RPEPageState();
}

class _RPEPageState extends State<RPEPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return Scaffold(
          //
          body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            // AppBar
            //
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              elevation: 0,
              centerTitle: true,
              title: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15))),
                      context: context,
                      builder: (context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              title: Text('Choose event',
                                  style:
                                      Theme.of(context).textTheme.displayLarge),
                            ),
                          ],
                        );
                      });
                },
              ),
            )
          ];
        },

        //
        // Body
        //

        body: const Center(),
      ));
    });
  }
}
