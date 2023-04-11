import 'package:flutter/material.dart';
import 'package:testdev/UI/widgets/listtile_bottomsheet.dart';
import 'package:testdev/UI/widgets/telephone_form.dart';

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
                  Tab(text: 'All'),
                  Tab(text: 'Transactions'),
                  Tab(text: 'Ranking'),
                  Tab(text: 'Me')
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
                        child: Column(children: [
                          Container(
                            height: 800,
                            width: double.maxFinite,
                            color: Colors.green,
                          ),
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
                          Container(
                            height: 800,
                            width: double.maxFinite,
                            color: Colors.yellow,
                            child: const TelephoneNumber(
                                labelText: 'labelText', maxLenght: 20),
                          ),
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
                          Container(
                            height: 800,
                            width: double.maxFinite,
                            color: Colors.blue,
                          ),
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
                          const ListTileBottomSheet(),
                          Container(
                            height: 800,
                            width: double.maxFinite,
                            color: Colors.orange,
                          ),
                        ]),
                      ),
                    ),
                  ),
                  //
                  //
                  //
                ]),
          ),
        ],
      ),
    );
  }
}
