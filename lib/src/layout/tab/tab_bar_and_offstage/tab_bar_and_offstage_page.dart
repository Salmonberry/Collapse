import 'dart:math';

import 'package:collapse/src/res/dimens.dart';
import 'package:flutter/material.dart';

class TabBarAndOffstagePage extends StatefulWidget {
  const TabBarAndOffstagePage({Key? key}) : super(key: key);

  @override
  State<TabBarAndOffstagePage> createState() => _TabBarAndOffstagePageState();
}

class _TabBarAndOffstagePageState extends State<TabBarAndOffstagePage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  late TabController _tabController;
  final List<Widget> _pages = List.generate(4, (index) => Text('$index'));

  final _tabData = [
    {'icon': 'icon_wallet_nft.png', 'title': 'NFT'},
    {'icon': 'icon_wallet_interest.png', 'title': 'INTEREST'},
    {'icon': 'icon_wallet_transfer.png', 'title': 'Transfer'},
    {'icon': 'icon_wallet_receive.png', 'title': 'RECEIVE'}
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(length: _pages.length, vsync: this);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          _currentIndex = _tabController.index;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Tab Bar And OffstagePage'),
        ),
        body: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(bottom: 9),
                decoration: const BoxDecoration(color: Colors.grey, boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(2, 2),
                      blurRadius: 4),
                ]),
                child: TabBar(
                  labelStyle: const TextStyle(
                      fontSize: 10, fontWeight: FontWeight.w500),
                  controller: _tabController,
                  tabs: List.generate(
                    _tabData.length,
                    (index) => Tab(
                      icon: Icon(Icons.abc_sharp,
                          color: index == _currentIndex
                              ? Colors.amberAccent
                              : Colors.amberAccent.withOpacity(0.1),
                          size: 27),
                      child: Text((_tabData[index]['title'])!,
                          style: TextStyle(
                              color: index == _currentIndex
                                  ? Colors.white
                                  : Colors.brown)),
                    ),
                  ),
                  indicatorWeight: 3,
                  indicatorColor: Colors.red.shade50,
                  indicatorSize: TabBarIndicatorSize.label,
                )),
            Expanded(child: _buildContent(_currentIndex))
          ],
        ),
      );

  /// 在同一个页面 根据切换显示不同内容
  // Widget _buildContent(int currentIndex) => Container(
  //       color: Colors.red,
  //       child: Column(
  //         children: List.generate(
  //           _pages.length,
  //           (index) => Expanded(
  //             child: Offstage(
  //               offstage: currentIndex != index,
  //               child: _pages[index],
  //             ),
  //           ),
  //         ),
  //       ),
  //     );

  Widget _buildContent(int currentIndex) =>
      Container(color: Colors.amber.shade100, child: _pages[currentIndex]);
}
