import 'package:Collapse/res/dimens.dart';
import 'package:Collapse/widgets/item_button.dart';
import 'package:flutter/material.dart';

import 'domain/home_item_entity.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<HomeItemEntity> _items = [
    HomeItemEntity('Buttons', Icons.add, '/buttons_panel'),
    HomeItemEntity('Inputs', Icons.ac_unit_rounded, '/input_widgets'),
    HomeItemEntity('Layouts', Icons.change_circle, '/layout'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Container(
            padding: const EdgeInsets.all(AppDimens.dimen20),
            child: Wrap(
                spacing: AppDimens.dimen10,
                runSpacing: AppDimens.dimen10,
                children: List.generate(
                    _items.length,
                    (index) => ItemButton(_items[
                        index])))) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
