import 'package:collapse/src/res/colors.dart';
import 'package:collapse/src/res/dimens.dart';
import 'package:flutter/material.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage>
    with SingleTickerProviderStateMixin {
  late final List<Widget> _pages = const [
    Center(child: Text('unused', textAlign: TextAlign.center)),
    Center(child: Text('used', textAlign: TextAlign.center)),
    Center(child: Text('expire', textAlign: TextAlign.center))
  ];
  TabController? _tabController;
  final _tabData = [
    {'title': '01'},
    {'title': '02'},
    {'title': '03'}
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
                  'Tab Bar Page',
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
                            (_tabData[index]['title'])!,
                            style: const TextStyle(
                                fontSize: AppDimens.dimens16,
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
