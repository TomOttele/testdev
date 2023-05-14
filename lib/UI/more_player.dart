import 'package:flutter/material.dart';
import 'package:testdev/UI/wallet_player.dart';
import 'package:testdev/UI/widgets/divider.dart';
import 'package:testdev/UI/widgets/listtile_leaderboard.dart';
import 'package:testdev/UI/widgets/listtile_setting.dart';
import 'package:testdev/UI/widgets/listtile_transaction.dart';
import 'package:testdev/UI/widgets/separator.dart';

class MorePage extends StatefulWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    TabController tabController = TabController(length: 4, vsync: this);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: false,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text("More", style: Theme.of(context).textTheme.displayLarge),
      ),
      //
      //
      //
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.01,
          ),
          //
          // TabBar
          //
          Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
                labelStyle: Theme.of(context).textTheme.bodyMedium,
                controller: tabController,
                indicatorColor: Colors.transparent,
                labelPadding: const EdgeInsets.only(left: 15, right: 15),
                isScrollable: true,
                tabs: const [
                  Tab(text: 'Transactions'),
                  Tab(text: 'Leaderboard'),
                  Tab(text: 'Me'),
                  Tab(text: 'Catalogue')
                ]),
          ),
          //
          // TabBarView
          //
          Expanded(
            child: TabBarView(
              controller: tabController,
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: [
                //
                //
                //
                SingleChildScrollView(
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TransactionWallet(
                                profilePicture:
                                    'https://b.fssta.com/uploads/application/soccer/headshots/885.png',
                                transactionAmount: '250',
                                transactionInfo: 'Pissed in shower',
                                player: 'Cristiano Ronaldo',
                                date: '17.05.23'),
                            const TransactionWallet(
                                profilePicture:
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfQreMZtxEJvKZx7CD95ncteYL9RGW9rjyTvu3f-HHl2gat-rrqvgeNOhzU3Gq8w8aaHY&usqp=CAU',
                                transactionAmount: '250',
                                transactionInfo: 'Late - Training',
                                player: 'Neymar Jr',
                                date: '17.05.23'),
                            const Separator(),
                            const Text('   17.05.23'),
                            const TransactionWallet(
                                transactionAmount: '250',
                                transactionInfo: 'Pissed in shower',
                                player: 'Lionel Messi',
                                date: '17.05.23'),
                            const TransactionWallet(
                                profilePicture:
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfQreMZtxEJvKZx7CD95ncteYL9RGW9rjyTvu3f-HHl2gat-rrqvgeNOhzU3Gq8w8aaHY&usqp=CAU',
                                transactionAmount: '250',
                                transactionInfo: 'Pissed in shower',
                                date: '17.05.23',
                                player: 'Neymar Jr'),
                            const TransactionWallet(
                                transactionAmount: '250',
                                transactionInfo: 'Pissed in shower',
                                player: 'Lionel Messi',
                                date: '17.05.23'),
                            SizedBox(height: size.height * 0.2)
                          ]),
                    ),
                  ),
                ),
                //
                //
                //

                SingleChildScrollView(
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: <Color>[
                                  Color.fromARGB(255, 48, 48, 48),
                                  Color.fromARGB(255, 208, 208, 208),
                                ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3)),
                              ],
                              color: Theme.of(context).colorScheme.onPrimary,
                              borderRadius: BorderRadius.circular(
                                25,
                              ),
                            ),
                            child: Stack(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
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
                                    SizedBox(height: size.height * 0.012)
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15))),
                              child: Column(
                                children: const [
                                  Leaderboard(
                                      ranking: '4',
                                      totalAmount: '1.809',
                                      player: 'Lionel Messi'),
                                  DividerLine(),
                                  Leaderboard(
                                      ranking: '5',
                                      totalAmount: '1.809',
                                      player: 'Lionel Messi'),
                                  DividerLine(),
                                  Leaderboard(
                                      ranking: '6',
                                      totalAmount: '1.809',
                                      player: 'Lionel Messi'),
                                  DividerLine(),
                                  Leaderboard(
                                      ranking: '7',
                                      totalAmount: '1.809',
                                      player: 'Lionel Messi'),
                                  DividerLine(),
                                  Leaderboard(
                                      ranking: '8',
                                      totalAmount: '1.809',
                                      player: 'Lionel Messi'),
                                  DividerLine(),
                                  Leaderboard(
                                      ranking: '9',
                                      totalAmount: '1.809',
                                      player: 'Lionel Messi'),
                                  DividerLine(),
                                  Leaderboard(
                                      ranking: '10',
                                      totalAmount: '1.809',
                                      player: 'Lionel Messi'),
                                  DividerLine(),
                                  Leaderboard(
                                      ranking: '11',
                                      totalAmount: '1.809',
                                      player: 'Lionel Messi'),
                                  DividerLine(),
                                  Leaderboard(
                                      ranking: '12',
                                      totalAmount: '1.809',
                                      player: 'Lionel Messi'),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.2),
                        ],
                      ),
                    ),
                  ),
                ),
                //
                //
                //
                SingleChildScrollView(
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            TransactionWallet(
                              transactionAmount: '250',
                              transactionInfo: 'Pissed in shower',
                              player: 'Lionel Messi',
                              date: '17.05.23',
                            ),
                            TransactionWallet(
                                transactionAmount: '250',
                                transactionInfo: 'Late - Training',
                                player: 'Lionel Messi',
                                date: '17.05.23'),
                            Separator(),
                          ]),
                    ),
                  ),
                ),
                //
                //
                //
                SingleChildScrollView(
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.01,
                          left: size.width * 0.01,
                          right: size.width * 0.01,
                          bottom: size.height * 0.2),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onPrimary,
                          borderRadius: BorderRadius.circular(
                            25,
                          ),
                        ),
                        child: Column(children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.01),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                ListTileSetting(
                                    title: 'Training late', trailing: '20€'),
                                DividerLine(),
                                ListTileSetting(
                                    title: 'Game late', trailing: '25€'),
                                DividerLine(),
                                ListTileSetting(
                                    title: 'Pissed shower', trailing: '20€'),
                                DividerLine(),
                                ListTileSetting(
                                    title: 'Wrong equipment', trailing: '15€')
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
