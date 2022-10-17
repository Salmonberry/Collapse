import 'package:Collapse/home/domain/home_item_entity.dart';
import 'package:Collapse/res/dimens.dart';
import 'package:Collapse/widgets/item_button.dart';
import 'package:flutter/material.dart';

class GridListPage extends StatefulWidget {
  const GridListPage({Key? key}) : super(key: key);

  @override
  State<GridListPage> createState() => _GridListPageState();
}

class _GridListPageState extends State<GridListPage> {
  final List<HomeItemEntity> _items = [
    HomeItemEntity('TabBar and TabBarView', Icons.abc_outlined, '/grid_view_column'),
    HomeItemEntity('TabBar and Offstage', Icons.abc_outlined, '/grid_view_layout'),
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
