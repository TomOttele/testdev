// ignore_for_file: prefer_const_constructors

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

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

/*class ChoiceChips {
  static final all = <ChoiceChipData>[
    ChoiceChipData(
      label: 'All',
      isSelected: true,
      selectedColor: Colors.blue,
      textColor: Colors.white,
    ),
    ChoiceChipData(
      label: 'Training',
      isSelected: true,
      selectedColor: Colors.blue,
      textColor: Colors.white,
    ),
    ChoiceChipData(
      label: 'Games',
      isSelected: true,
      selectedColor: Colors.blue,
      textColor: Colors.white,
    )
  ];

  static map(ChoiceChip Function(dynamic choiceChip) param0) {}
}*/

// FLutter Toast Message
Future showToast(String message) async {
  await Fluttertoast.cancel();
  Fluttertoast.showToast(msg: message, fontSize: 18);
}

class _WalletPageState extends State<WalletPage> {
  late ScrollController controller;
  final double spacing = 8;
  final isDialOpen = ValueNotifier(false);

  List<ChoiceChipData> choiceChips = ChoiceChips.all;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return WillPopScope(
        onWillPop: () async {
          if (isDialOpen.value) {
            isDialOpen.value = false;
            return false;
          } else {
            return true;
          }
        },
        child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: SpeedDial(
            animatedIcon: AnimatedIcons.menu_close,
            overlayColor: Colors.black,
            overlayOpacity: 0.3,
            spacing: 12,
            elevation: 20,
            spaceBetweenChildren: 15,
            closeManually: false,
            openCloseDial: isDialOpen,
            children: [
              //
              SpeedDialChild(
                  child: Icon(Icons.mail),
                  label: 'Mail',
                  backgroundColor: Theme.of(context).colorScheme.onPrimary),

              //
              SpeedDialChild(
                  child: Icon(Icons.mail),
                  label: 'Mail',
                  backgroundColor: Theme.of(context).colorScheme.onPrimary),
              //
              SpeedDialChild(
                  child: Icon(Icons.mail),
                  onTap: () => showToast('Selected Twitter...'),
                  backgroundColor: Theme.of(context).colorScheme.onPrimary)
            ],
          ),
          //
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
                  title: Text('25.907,64€',
                      style: Theme.of(context).textTheme.displayMedium),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onPrimary,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Align(
                                        child: StackItem2(size: size),
                                      ),
                                      Align(
                                        child: StackItem1(size: size),
                                      ),
                                      Align(
                                        child: StackItem3(size: size),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ];
            },
            //
            // Body
            //
            body: SafeArea(
              child: ListView(
                //controller: controller,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            SafeArea(
                              child: Column(
                                children: [
                                  //
                                  //
                                  //
                                  buildChoiceChips(),
                                  //
                                  //
                                  //

                                  const Separator(),

                                  //
                                  //
                                  //

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        '  Transactions',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    height: size.height * 0.27,
                                    width: size.width * 1,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: <Widget>[
                                        Expanded(child: WalletTransaction())
                                      ],
                                    ),
                                  ),

                                  //
                                  //
                                  const Separator(),
                                  const Separator(),

                                  //
                                  //
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        '  Me',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                      )
                                    ],
                                  ),
                                  Container(
                                    height: size.height * 0.27,
                                    width: size.width * 1,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Expanded(child: WalletTransaction())
                                      ],
                                    ),
                                  ),

                                  //
                                  //
                                  const Separator(),
                                  const Separator(),
                                  //
                                  //
                                  Container(
                                    height: size.height * 0.25,
                                    width: size.width * 1,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        ListTile(
                                          title: Text('Choose your acount',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium),
                                        ),

                                        //
                                        //
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 70),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget buildChoiceChips() => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: choiceChips
              .map(
                (choiceChip) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: ChoiceChip(
                    selected: choiceChip.isSelected,
                    selectedColor: choiceChip.selectedColor,
                    backgroundColor: choiceChip.unselectedColor,
                    label: Text(choiceChip.label),
                    labelStyle: Theme.of(context).textTheme.bodyLarge,
                    onSelected: (isSelected) => setState(() {
                      choiceChips = choiceChips.map((otherChip) {
                        final newChip = otherChip.copy(
                          label: choiceChip.label,
                          textColor: choiceChip.textColor,
                          selectedColor: choiceChip.selectedColor,
                          unselectedColor: choiceChip.unselectedColor,
                          isSelected: false,
                        );

                        return choiceChip == newChip
                            ? newChip.copy(
                                isSelected: isSelected,
                                label: choiceChip.label,
                                textColor: choiceChip.textColor,
                                selectedColor: choiceChip.selectedColor,
                                unselectedColor: const Color(252525),
                              )
                            : newChip;
                      }).toList();
                    }),
                  ),
                ),
              )
              .toList(),
        ),
      );
}

//
//
//
//
//
class StackItem1 extends StatelessWidget {
  const StackItem1({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.24,
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipPolygon(
                sides: 6,
                borderRadius: 8,
                child: Container(
                  color: Colors.yellow,
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
              Text("Lionel Messi ",
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge),
              Text(
                "3.815€",
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          )
        ],
      ),
    );
  }
}

//
//
//
//
//
//
class StackItem2 extends StatelessWidget {
  const StackItem2({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.24,
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipPolygon(
                sides: 6,
                borderRadius: 8,
                child: Container(
                  color: const Color.fromARGB(255, 190, 190, 190),
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
              Text("Lionel Messi da cruz",
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge),
              Text(
                "3.815€",
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          )
        ],
      ),
    );
  }
}

//
//
//
//
//
//
//
class StackItem3 extends StatelessWidget {
  const StackItem3({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.24,
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipPolygon(
                sides: 6,
                borderRadius: 8,
                child: Container(
                  color: const Color.fromARGB(255, 105, 28, 0),
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
              Text("Lionel Messi",
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge),
              Text("3.815€",
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium),
            ],
          )
        ],
      ),
    );
  }
}
