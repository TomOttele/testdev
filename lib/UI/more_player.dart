import 'package:flutter/material.dart';
import 'package:testdev/UI/wallet_player.dart';
import 'package:testdev/UI/widgets/listtile_infraction.dart';
import 'package:testdev/UI/widgets/listtile_leaderboard.dart';
import 'package:testdev/UI/widgets/xxxlisttile_transaction.dart';
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
                  Tab(text: 'Infractions')
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
                            const Text('   19.05.23'),
                            const Transaction(
                                profilePicture:
                                    'https://b.fssta.com/uploads/application/soccer/headshots/885.png',
                                transactionStatus: TransactionStatus.paid,
                                transactionAmount: '250',
                                transactionInfo: 'Pissed in shower',
                                player: 'Cristiano Ronaldo'),
                            const Transaction(
                                profilePicture:
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfQreMZtxEJvKZx7CD95ncteYL9RGW9rjyTvu3f-HHl2gat-rrqvgeNOhzU3Gq8w8aaHY&usqp=CAU',
                                transactionStatus: TransactionStatus.unpaid,
                                transactionAmount: '250',
                                transactionInfo: 'Late - Training',
                                player: 'Neymar Jr'),
                            const Separator(),
                            const Text('   17.05.23'),
                            const Transaction(
                                transactionStatus: TransactionStatus.paid,
                                transactionAmount: '250',
                                transactionInfo: 'Pissed in shower',
                                player: 'Lionel Messi'),
                            const Transaction(
                                profilePicture:
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfQreMZtxEJvKZx7CD95ncteYL9RGW9rjyTvu3f-HHl2gat-rrqvgeNOhzU3Gq8w8aaHY&usqp=CAU',
                                transactionStatus: TransactionStatus.paid,
                                transactionAmount: '250',
                                transactionInfo: 'Pissed in shower',
                                player: 'Neymar Jr'),
                            const Transaction(
                                transactionStatus: TransactionStatus.paid,
                                transactionAmount: '250',
                                transactionInfo: 'Pissed in shower',
                                player: 'Lionel Messi'),
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
                //
                //
                SingleChildScrollView(
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('   19.05.23'),
                            Transaction(
                                transactionStatus: TransactionStatus.paid,
                                transactionAmount: '250',
                                transactionInfo: 'Pissed in shower',
                                player: 'Lionel Messi'),
                            Transaction(
                                transactionStatus: TransactionStatus.unpaid,
                                transactionAmount: '250',
                                transactionInfo: 'Late - Training',
                                player: 'Lionel Messi'),
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
                      padding: const EdgeInsets.all(5.0),
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
                            SizedBox(height: size.height * 0.2),
                          ],
                        ),
                      ]),
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
