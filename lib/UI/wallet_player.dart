import 'package:flutter/material.dart';
import 'package:testdev/UI/widgets/choicechip_data.dart';
import 'package:testdev/UI/widgets/choicechip.dart';
import 'package:testdev/application/theme_Service.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'dart:async';
import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:provider/provider.dart';
import 'package:testdev/UI/widgets/separator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:testdev/UI/widgets/Xdata.dart';
import 'package:image_picker/image_picker.dart';
import 'package:testdev/UI/widgets/sortable_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';

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

class _WalletPageState extends State<WalletPage> {
  final double spacing = 8;

  List<ChoiceChipData> choiceChips = ChoiceChips.all;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<ThemeService>(
      builder: (context, themeService, child) {
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
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  elevation: 0,
                  centerTitle: true,
                  title: const Text(
                    '25.807,64€',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onPrimary,
                          borderRadius: BorderRadius.only(
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
                                        alignment: Alignment(-0.85, 0),
                                        child: StackItem2(size: size * 0.9),
                                      ),
                                      Align(
                                          alignment: Alignment(0, 0),
                                          child: StackItem1(size: size)),
                                      Align(
                                          alignment: const Alignment(0.85, 0),
                                          child: StackItem3(size: size * 0.9)),
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
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Stack(
                        children: <Widget>[
                          SafeArea(
                            child: Column(
                              children: [
                                buildChoiceChips(),
                                Column(
                                  children: [
                                    const Separator(),
                                    Container(
                                      height: size.height * 0.25,
                                      width: size.width * 1,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                    ),
                                    const Separator(),
                                    Container(
                                      height: size.height * 0.25,
                                      width: size.width * 1,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                    ),
                                    const Separator(),
                                    Container(
                                      height: size.height * 0.25,
                                      width: size.width * 1,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
      },
    );
  }

  Widget buildChoiceChips() => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: choiceChips
              .map(
                (choiceChip) => Padding(
                  padding: const EdgeInsets.all(2),
                  child: ChoiceChip(
                    label: Text(choiceChip.label),
                    labelStyle: TextStyle(color: Colors.white),
                    onSelected: (isSelected) => setState(() {
                      choiceChips = choiceChips.map((otherChip) {
                        final newChip = otherChip.copy(
                          label: choiceChip.label,
                          textColor: choiceChip.textColor,
                          selectedColor: choiceChip.selectedColor,
                          isSelected: false,
                        );

                        return choiceChip == newChip
                            ? newChip.copy(
                                isSelected: isSelected,
                                label: choiceChip.label,
                                textColor: choiceChip.textColor,
                                selectedColor: choiceChip.selectedColor)
                            : newChip;
                      }).toList();
                    }),
                    selected: choiceChip.isSelected,
                    selectedColor: Colors.grey,
                    backgroundColor: Colors.transparent,
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
    return Container(
      width: size.width * 0.25,
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
              Text("Lionel Messi",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 17)),
              Text(
                "3.815€",
                style: TextStyle(color: Colors.grey, fontSize: 14),
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
    return Container(
      width: size.width * 0.25,
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipPolygon(
                sides: 6,
                borderRadius: 8,
                child: Container(
                  color: Color.fromARGB(255, 190, 190, 190),
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
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16)),
              Text(
                "3.815€",
                style: TextStyle(color: Colors.grey, fontSize: 14),
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
    return Container(
      width: size.width * 0.25,
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipPolygon(
                sides: 6,
                borderRadius: 8,
                child: Container(
                  color: Color.fromARGB(255, 105, 28, 0),
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
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16)),
              Text(
                "3.815€",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          )
        ],
      ),
    );
  }
}
