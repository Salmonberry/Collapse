
import 'package:collapse/src/res/dimens.dart';
import 'package:flutter/material.dart';

import 'domains/tab_entity.dart';

class TabBarAndTabBarViewPage extends StatefulWidget {
  const TabBarAndTabBarViewPage({Key? key}) : super(key: key);

  @override
  State<TabBarAndTabBarViewPage> createState() => _TabBarAndTabBarViewPageState();
}

class _TabBarAndTabBarViewPageState extends State<TabBarAndTabBarViewPage>
    with SingleTickerProviderStateMixin {
  late final List<Widget> _pages = const [
    Center(child: Text('01', textAlign: TextAlign.center)),
    Center(child: Text('02', textAlign: TextAlign.center)),
    Center(child: Text('03', textAlign: TextAlign.center))
  ];
  TabController? _tabController;

  final _tabData = [
    TabEntity('01'),
    TabEntity('02'),
    TabEntity('03'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(length: _tabData.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: _tabData.length,
        child: Scaffold(
            appBar: AppBar(
                excludeHeaderSemantics: true,
                centerTitle: true,
                // backgroundColor: const Color(BACKGROUND_COLOR),
                elevation: AppDimens.dimens0,
                title: const Text(
                  'TabBar and TabBarView',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
            body: Column(
              children: [
                Container(
                  color: Colors.grey,
                  height: 60,
                  child: TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.label,
                    padding: const EdgeInsets.only(bottom: 10),
                    // enableFeedback: false,
                    tabs: List.generate(
                      _tabData.length,
                      (index) => Semantics(
                        explicitChildNodes: true,
                        excludeSemantics: true,
                        label: '',
                        child: Tab(
                          height: 40,
                          child: Text(
                            (_tabData[index].title),
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    //选项卡 切换的内容信息展示和调用
                    controller: _tabController,
                    children: _pages,
                  ),
                ),
              ],
            )),
      );
}
