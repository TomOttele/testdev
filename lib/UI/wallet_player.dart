import 'package:flutter/material.dart';
import 'package:testdev/UI/widgets/dropdown_button.dart';
import 'package:testdev/UI/widgets/elevatedbutton.dart';
import 'package:testdev/UI/widgets/listtile_infraction.dart';
import 'package:testdev/UI/widgets/listtile_leaderboard.dart';
import 'package:testdev/UI/widgets/listtile_transaction.dart';
import 'package:testdev/UI/widgets/number_form.dart';
import 'package:testdev/UI/widgets/text_form.dart';
import 'package:testdev/UI/widgets/xchoicechip_data.dart';
import 'package:testdev/UI/widgets/xchoicechip.dart';
import 'package:testdev/application/theme_Service.dart';
import 'package:provider/provider.dart';
import 'package:testdev/UI/widgets/separator.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

Future showToast(String message) async {
  await Fluttertoast.cancel();
  Fluttertoast.showToast(msg: message, fontSize: 18);
}

class _WalletPageState extends State<WalletPage> {
  List<String> itemsPlayers = [
    'Lionel Messi',
    'Cristiano Ronaldo',
    'Kylian Mbappe'
  ];
  String? selectedItem = 'Lionel Messi';
  List<String> itemsInfractions = [
    'Training Late',
    'Game Late',
    'Pissed in shower'
  ];
  List<String> itemsDate = ['21.08', '20.08', '19.08'];

  late ScrollController controller;
  final double spacing = 8;
  final isDialOpen = ValueNotifier(false);

  List<ChoiceChipData> choiceChips = ChoiceChips.all;

  TableRow buildRow(List<String> cells) => TableRow(
        children: cells.map((cell) {
          return Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyMedium,
                  cell));
        }).toList(),
      );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer<ThemeService>(
      builder: (context, themeService, child) {
        return DefaultTabController(
          length: 4,
          child: Scaffold(
            //
            // FloatingActionButton
            //

            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.07),
              child: FloatingActionButton(
                tooltip: 'Add',
                child: const Icon(Icons.add),
                onPressed: () => showBottomSheet(
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15)),
                  ),
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: size.height * 0.9,
                        child: DefaultTabController(
                            length: 3,
                            child: Column(
                              children: [
                                SizedBox(
                                  child: TabBar(
                                    labelStyle:
                                        Theme.of(context).textTheme.bodyMedium,
                                    isScrollable: true,
                                    physics: const BouncingScrollPhysics(
                                        parent:
                                            AlwaysScrollableScrollPhysics()),
                                    indicatorColor: Colors.transparent,
                                    tabs: const [
                                      Tab(
                                        text: 'Inflow',
                                      ),
                                      Tab(
                                        text: 'Outflow',
                                      ),
                                      Tab(
                                        text: 'New infraction',
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                      //
                                      // First TabBar
                                      //
                                      SingleChildScrollView(
                                        child: SafeArea(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 12.0,
                                                bottom: 12,
                                                left: 6,
                                                right: 6),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ListTile(
                                                  title: Text('Infraction',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displayMedium),
                                                ),
                                                // Player picker
                                                const DropDownMenu(
                                                  items: [
                                                    'Lionel Messi',
                                                    'Cristiano Ronaldo',
                                                    'Kylian Mbappé',
                                                    'Sven Schmit'
                                                  ],
                                                  labelText: 'Choose a player',
                                                ),
                                                //
                                                const Separator(),
                                                //
                                                const DropDownMenu(
                                                  items: [
                                                    'Pissed in shower',
                                                    'Training late',
                                                    'Game late',
                                                    'Wrong Equipment'
                                                  ],
                                                  labelText: 'Infraction',
                                                ),
                                                //
                                                const Separator(),
                                                //
                                                //
                                                const DropDownMenu(
                                                  items: ['18.09', '19.09'],
                                                  labelText: 'Date',
                                                ),
                                                const Separator(),
                                                //
                                                //
                                                Center(
                                                  child: ElevatedButtom(
                                                    onPressed: () {},
                                                    text: 'Add',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      //
                                      // Second TabBar
                                      //
                                      SingleChildScrollView(
                                        child: SafeArea(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 12.0,
                                                bottom: 12,
                                                left: 6,
                                                right: 6),
                                            child: Column(
                                              children: [
                                                ListTile(
                                                  title: Text('Expense',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displayMedium),
                                                ),
                                                const TextForm(
                                                    labelText: 'Reason',
                                                    maxLenght: 30),

                                                const NumberForm(
                                                    labelText: 'Amount',
                                                    maxLenght: 7),
                                                //
                                                const Separator(),
                                                //
                                                Center(
                                                  child: ElevatedButtom(
                                                    onPressed: () {},
                                                    text: 'Add',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      //
                                      // Third TabBar
                                      //
                                      SingleChildScrollView(
                                        child: SafeArea(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 12.0,
                                                bottom: 12,
                                                left: 6,
                                                right: 6),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                //

                                                ListTile(
                                                  title: Text(
                                                      'Create a new infraction',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displayMedium),
                                                ),
                                                //

                                                const TextForm(
                                                    hintText:
                                                        'i.e. Pissed in shower',
                                                    labelText: 'Reason',
                                                    maxLenght: 20),

                                                //
                                                const NumberForm(
                                                    hintText: 'i.e. 5€',
                                                    labelText: '€',
                                                    maxLenght: 6),
                                                //
                                                const Separator(),

                                                Center(
                                                  child: ElevatedButtom(
                                                    onPressed: () {},
                                                    text: 'Add',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ),
                    );
                  },
                ),
              ),
            ),

            //
            // AppBar
            //

            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              elevation: 0,
              centerTitle: true,
              title: Text('25.907,64€',
                  style: Theme.of(context).textTheme.displayMedium),
            ),
            body: Column(children: <Widget>[
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
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        SizedBox(height: size.height * 0.012)
                      ],
                    ),
                  ],
                ),
              ),
              //
              // TabBar
              //

              TabBar(
                labelStyle: Theme.of(context).textTheme.bodyMedium,
                isScrollable: true,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                indicatorColor: Colors.transparent,
                tabs: const [
                  Tab(
                    text: 'Transactions',
                  ),
                  Tab(
                    text: 'Me',
                  ),
                  Tab(
                    text: 'Leaderboard',
                  ),
                  Tab(
                    text: 'Catalogue',
                  ),
                ],
              ),
              //
              //
              //
              Expanded(
                child: TabBarView(
                  children: [
                    //
                    //1. Tabbar
                    //

                    SingleChildScrollView(
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 12.0, bottom: 12, left: 6, right: 6),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('   19.05.23'),
                                const TransactionWallet(
                                    profilePicture:
                                        'https://b.fssta.com/uploads/application/soccer/headshots/885.png',
                                    transactionAmount: '250',
                                    transactionInfo: 'Pissed in shower',
                                    player: 'Cristiano Ronaldo'),
                                const TransactionWallet(
                                    profilePicture:
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfQreMZtxEJvKZx7CD95ncteYL9RGW9rjyTvu3f-HHl2gat-rrqvgeNOhzU3Gq8w8aaHY&usqp=CAU',
                                    transactionAmount: '250',
                                    transactionInfo: 'Late - Training',
                                    player: 'Neymar Jr'),
                                const Separator(),
                                const Text('   17.05.23'),
                                const TransactionWallet(
                                    transactionAmount: '250',
                                    transactionInfo: 'Pissed in shower',
                                    player: 'Lionel Messi'),
                                const TransactionWallet(
                                    profilePicture:
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfQreMZtxEJvKZx7CD95ncteYL9RGW9rjyTvu3f-HHl2gat-rrqvgeNOhzU3Gq8w8aaHY&usqp=CAU',
                                    transactionAmount: '250',
                                    transactionInfo: 'Pissed in shower',
                                    player: 'Neymar Jr'),
                                const TransactionWallet(
                                    transactionAmount: '250',
                                    transactionInfo: 'Pissed in shower',
                                    player: 'Lionel Messi'),
                                SizedBox(height: size.height * 0.2)
                              ]),
                        ),
                      ),
                    ),

                    //
                    // 2. Tabbar
                    //

                    SingleChildScrollView(
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('   19.05.23'),
                                TransactionWallet(
                                    transactionAmount: '250',
                                    transactionInfo: 'Pissed in shower',
                                    player: 'Lionel Messi'),
                                TransactionWallet(
                                    transactionAmount: '250',
                                    transactionInfo: 'Late - Training',
                                    player: 'Lionel Messi'),
                                Separator(),
                              ]),
                        ),
                      ),
                    ),

                    //
                    // 3.Tabbar
                    //

                    SingleChildScrollView(
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              const Leaderboard(
                                  ranking: '4',
                                  totalAmount: '1.809',
                                  player: 'Lionel Messi'),
                              const Leaderboard(
                                  ranking: '5',
                                  totalAmount: '1.809',
                                  player: 'Lionel Messi'),
                              const Leaderboard(
                                  ranking: '6',
                                  totalAmount: '1.809',
                                  player: 'Lionel Messi'),
                              const Leaderboard(
                                  ranking: '7',
                                  totalAmount: '1.809',
                                  player: 'Lionel Messi'),
                              const Leaderboard(
                                  ranking: '8',
                                  totalAmount: '1.809',
                                  player: 'Lionel Messi'),
                              const Leaderboard(
                                  ranking: '9',
                                  totalAmount: '1.809',
                                  player: 'Lionel Messi'),
                              const Leaderboard(
                                  ranking: '10',
                                  totalAmount: '1.809',
                                  player: 'Lionel Messi'),
                              const Leaderboard(
                                  ranking: '11',
                                  totalAmount: '1.809',
                                  player: 'Lionel Messi'),
                              const Leaderboard(
                                  ranking: '12',
                                  totalAmount: '1.809',
                                  player: 'Lionel Messi'),
                              SizedBox(height: size.height * 0.2),
                            ],
                          ),
                        ),
                      ),
                    ),

                    //
                    // %.TabBar
                    //
                    SingleChildScrollView(
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(children: [
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Infraction(
                                      infractionName: 'Training late',
                                      infractionAmount: '50'),
                                  const Infraction(
                                      infractionName: 'Game late',
                                      infractionAmount: '100'),
                                  const Infraction(
                                      infractionName: 'Pissed in shower',
                                      infractionAmount: '20'),
                                  SizedBox(height: size.height * 0.2)
                                ]),
                          ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
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
        width: size.width * 0.3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: SizedBox(
                width: size.width * 0.2,
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
                                'https://b.fssta.com/uploads/application/soccer/headshots/885.png',
                                borderWidth: 1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Text("Cristiano Ronaldo ",
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge),
            SizedBox(
              height: size.height * 0.007,
            ),
            Text(
              "3.815€",
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ));
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
        width: size.width * 0.3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: SizedBox(
                width: size.width * 0.2,
                child: Stack(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ClipPolygon(
                          sides: 6,
                          borderRadius: 8,
                          child: Container(
                            color: Colors.grey,
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
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Text("Lionel Messi ",
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge),
            SizedBox(height: size.height * 0.007),
            Text(
              "3.815€",
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ));
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
        width: size.width * 0.3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: SizedBox(
                width: size.width * 0.2,
                child: Stack(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ClipPolygon(
                          sides: 6,
                          borderRadius: 8,
                          child: Container(
                            color: const Color.fromARGB(255, 128, 44, 6),
                            padding: const EdgeInsets.all(3.0),
                            child: ClipPolygon(
                              sides: 6,
                              borderRadius: 8,
                              child: CircularProfileAvatar(
                                radius: 20,
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfQreMZtxEJvKZx7CD95ncteYL9RGW9rjyTvu3f-HHl2gat-rrqvgeNOhzU3Gq8w8aaHY&usqp=CAU',
                                borderWidth: 1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Text("Neymar Jr ",
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge),
            SizedBox(height: size.height * 0.007),
            Text(
              "3.815€",
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ));
  }
}
