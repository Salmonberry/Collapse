import 'package:Collapse/home/domain/home_item_entity.dart';
import 'package:Collapse/res/dimens.dart';
import 'package:Collapse/widgets/item_button.dart';
import 'package:flutter/material.dart';

class LayoutListPage extends StatefulWidget {
  const LayoutListPage({Key? key}) : super(key: key);

  @override
  State<LayoutListPage> createState() => _LayoutListPageState();
}

class _LayoutListPageState extends State<LayoutListPage> {
  final List<HomeItemEntity> _items = [
    HomeItemEntity('Tab', Icons.abc_outlined, '/tab_list_page'),
    HomeItemEntity('Grid', Icons.add_card_sharp, '/grid_view_list_page'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Layout List Page')),
        body: Container(
            padding: const EdgeInsets.all(AppDimens.dimen20),
            child: Wrap(
                spacing: AppDimens.dimen10,
                runSpacing: AppDimens.dimen10,
                children: List.generate(
                    _items.length, (index) => ItemButton(_items[index])))));
  }
}
