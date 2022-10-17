import 'package:collapse/src/layout/grid_view/grid_view_column/widgets/setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'widgets/setting_item.dart';

class GridViewColumnPage extends StatefulWidget {
  const GridViewColumnPage({Key? key}) : super(key: key);

  @override
  State<GridViewColumnPage> createState() => _GridViewColumnPageState();
}

class _GridViewColumnPageState extends State<GridViewColumnPage> {
  late Future _future;
  String _currentDeviceName = '';

  final List<Setting> _settingList = [
    Setting(Colors.brown, Icons.ac_unit, '壁纸设置'),
    Setting(Colors.red, Icons.cabin, '上课禁用'),
    Setting(Colors.yellow, Icons.safety_check, '角色选择'),
    Setting(Colors.cyan, Icons.abc_outlined, '水杯校准'),
    Setting(Colors.lightBlue, Icons.g_mobiledata, '水杯信息 '),
    Setting(Colors.pinkAccent, Icons.vaccines, '解绑设备'),
  ];

  @override
  void initState() {
    super.initState();

    _future = Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('GridView Column Page'),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: FutureBuilder(future: _future, builder: _buildFuture)),
      );

  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        print('还没有开始网络请求');
        return const Text('还没有开始网络请求');
      case ConnectionState.active:
        print('active');
        return const Text('ConnectionState.active');
      case ConnectionState.waiting:
        print('waiting');
        return Container();
      case ConnectionState.done:
        return _buildPage(context);

      default:
        return Container();
    }
  }

  Widget _buildPage(BuildContext context) => Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: LayoutBuilder(builder: (context, constraints) {
          print('constraints:$constraints');
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildUserPanel(),
              const SizedBox(
                height: 20,
              ),
              _buildSettingPanel(),
            ],
          );
        }),
      );

  Widget _buildSettingPanel() => Container(child: LayoutBuilder(
        builder: (context, constraints) {
          print('$constraints');
          return Container(
            child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
                itemCount: _settingList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    crossAxisCount: 2,
                    //横轴三个子widget
                    childAspectRatio: 1.0 //宽高比为1时，子widget
                    ),
                itemBuilder: (context, index) => SettingItem(
                      _settingList[index],
                      onTapped: () => Fluttertoast.showToast(msg: '$index'),
                    )),
          );
        },
      ));

  Widget _buildUserPanel() => Container(
      padding: const EdgeInsets.only(left: 30, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              height: 25,
              width: 25,
              child: const Icon(Icons.data_thresholding_outlined)),
          const SizedBox(width: 10),
          Expanded(
              child: Text(
            '当前设备：${_currentDeviceName}',
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ))
        ],
      ));
}
