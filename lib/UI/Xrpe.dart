import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testdev/application/theme_Service.dart';

class RPEPage extends StatefulWidget {
  const RPEPage({super.key});

  @override
  State<RPEPage> createState() => _RPEPageState();
}

class _RPEPageState extends State<RPEPage> {
  bool _isSelected = false;

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
                                  style: Theme.of(context).textTheme.headline1),
                            ),
                            ListTile(
                              leading: const Icon(Icons.add),
                              title: const Text('Add event'),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.person),
                              title: const Text('11.10.2022 - Training'),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.person),
                              title: const Text('10.10.2022 - Game'),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      });
                },
                child: const Text('Choose event'),
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
