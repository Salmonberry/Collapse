import 'package:example/home/domain/home_item_entity.dart';
import 'package:example/res/dimens.dart';
import 'package:example/widgets/item_button.dart';
import 'package:flutter/material.dart';

class TabListPage extends StatefulWidget {
  const TabListPage({Key? key}) : super(key: key);

  @override
  State<TabListPage> createState() => _TabListPageState();
}

class _TabListPageState extends State<TabListPage> {
  final List<HomeItemEntity> _items = [
    HomeItemEntity('TabBar and TabBarView', Icons.abc_outlined, '/tab_bar_and_tab_bar_view_page'),
    HomeItemEntity('TabBar and Offstage', Icons.abc_outlined, '/tab_bar_and_offstage_page'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Tab List Page')),
        body: Container(
            padding: const EdgeInsets.all(AppDimens.dimen20),
            child: ListView(
                children: List.generate(
                    _items.length, (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                    child: ItemButton(_items[index]))))));
  }
}
