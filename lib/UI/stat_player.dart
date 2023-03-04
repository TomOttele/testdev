import 'package:flutter/material.dart';
import 'package:testdev/UI/widgets/choicechip_data.dart';
import 'package:testdev/UI/widgets/choicechip.dart';
import 'package:testdev/UI/widgets/wallet_transaction.dart';
import 'package:testdev/application/theme_Service.dart';
import 'package:provider/provider.dart';
import 'package:testdev/UI/widgets/separator.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PlayerStat extends StatefulWidget {
  const PlayerStat({Key? key}) : super(key: key);

  @override
  State<PlayerStat> createState() => _PlayerStatState();
}

// FLutter Toast Message
Future showToast(String message) async {
  await Fluttertoast.cancel();
  Fluttertoast.showToast(msg: message, fontSize: 18);
}

class _PlayerStatState extends State<PlayerStat> {
  late ScrollController controller;
  final double spacing = 8;

  List<ChoiceChipData> choiceChips = ChoiceChips.all;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              // AppBar
              //
              SliverAppBar(
                floating: true,
                snap: true,
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
                elevation: 0,
                centerTitle: true,
                title: InkWell(
                  child: const Text('Season 22/23'),
                  onTap: () {
                    showModalBottomSheet(
                        backgroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(15)),
                        ),
                        context: context,
                        builder: (context) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                title: Text('Season',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge),
                              ),
                              ListTile(
                                  title: Text('Season 22/23',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium))
                            ],
                          );
                        });
                  },
                ),
              ),

              SliverToBoxAdapter(
                child: Stack(
                  children: <Widget>[
                    Container(
                        height: size.height * 0.10,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onPrimary,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ClipPolygon(
                                sides: 6,
                                borderRadius: 8,
                                child: Container(
                                  color: Colors.white,
                                  padding: const EdgeInsets.all(3.0),
                                  child: ClipPolygon(
                                    sides: 6,
                                    borderRadius: 8,
                                    child: CircularProfileAvatar(
                                      radius: 20,
                                      'https://i.goalzz.com/?i=ashraf-zamrani%2Flionelmessi.gif',
                                      borderWidth: 1,
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Number',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Text(
                                      '10',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    )
                                  ]),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Age',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Text(
                                      '33',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    )
                                  ]),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Position',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Text(
                                      'Striker',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    )
                                  ]),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ];
          },
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).colorScheme.onPrimary),
                      height: size.height * 0.12,
                      width: size.width * 0.24,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '270',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            'Minutes',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).colorScheme.onPrimary),
                      height: size.height * 0.12,
                      width: size.width * 0.24,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '5',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            'Games',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).colorScheme.onPrimary),
                      height: size.height * 0.12,
                      width: size.width * 0.24,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '5',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            'Goals',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).colorScheme.onPrimary),
                      height: size.height * 0.12,
                      width: size.width * 0.24,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '3',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            'Assists',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).colorScheme.onPrimary),
                      height: size.height * 0.12,
                      width: size.width * 0.24,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '1',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            'Yellow',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).colorScheme.onPrimary),
                      height: size.height * 0.12,
                      width: size.width * 0.24,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '0',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            'Red',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '     Championship',
                      style: Theme.of(context).textTheme.displaySmall,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.tag_rounded),
                        Text(
                          '5',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.alarm),
                        Text(
                          '5',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.sports_soccer_rounded,
                          color: Color.fromARGB(255, 7, 91, 160),
                        ),
                        Text(
                          '5',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.sports_soccer_rounded,
                          color: Color.fromARGB(255, 173, 237, 175),
                        ),
                        Text(
                          '5',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.square_rounded,
                          color: Colors.yellow,
                        ),
                        Text(
                          '5',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.filter_none,
                          color: Colors.red,
                        ),
                        Text(
                          '5',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.square_rounded,
                          color: Colors.red,
                        ),
                        Text(
                          '5',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '     Cup',
                      style: Theme.of(context).textTheme.displaySmall,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.tag_rounded),
                        Text(
                          '5',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.alarm),
                        Text(
                          '5',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.sports_soccer_rounded,
                          color: Color.fromARGB(255, 7, 91, 160),
                        ),
                        Text(
                          '5',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.sports_soccer_rounded,
                          color: Color.fromARGB(255, 173, 237, 175),
                        ),
                        Text(
                          '5',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.square_rounded,
                          color: Colors.yellow,
                        ),
                        Text(
                          '5',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.filter_none,
                          color: Colors.red,
                        ),
                        Text(
                          '5',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.square_rounded,
                          color: Colors.red,
                        ),
                        Text(
                          '5',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ),
      );
    });
  }
}
