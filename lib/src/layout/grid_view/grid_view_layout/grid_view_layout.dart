import 'package:collapse/src/layout/grid_view/grid_view_layout/widgets/image_item.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GridViewLayoutPage extends StatefulWidget {
  const GridViewLayoutPage({Key? key}) : super(key: key);

  @override
  State<GridViewLayoutPage> createState() => _GridViewLayoutPageState();
}

class _GridViewLayoutPageState extends State<GridViewLayoutPage>
     {
  late Future _future;
  late List<String> _imageList;

  String _currentSelectedImageUrl = '';

  @override
  void initState() {
    super.initState();

    _future = Future.delayed(const Duration(seconds: 2), () {
      _imageList = [
        'https://nb-web-www.naiveblue.com/www-nb/20210531/a54y3OBXdZna.png!w640.jpg',
        'https://cdn.jsdelivr.net/gh/Salmonberry/FigureBedBySalmon@master/資源圖/QQ20220607-0.3qsm8okfvo80.jpg',
        'https://cdn.jsdelivr.net/gh/Salmonberry/FigureBedBySalmon@master/資源圖/迪卢克凯亚.2atzy9e6tekg.jpg',
        'https://cdn.jsdelivr.net/gh/Salmonberry/FigureBedBySalmon@master/資源圖/甘雨魈刻晴.3uksketwjzo0.jpg',
        'https://cdn.jsdelivr.net/gh/Salmonberry/FigureBedBySalmon@master/資源圖/可莉阿贝多webp.3gzbuc3aptk0.jpg'
      ];
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            color: Colors.black,
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context)),
        title: const Text('壁纸设置', style: TextStyle(color: Colors.black)),
      ),
      body: FutureBuilder(future: _future, builder: _buildFuture));

  // body: _buildPage(context));

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
        return const Center(
          child: CircularProgressIndicator(),
        );
      case ConnectionState.done:
        print('done');
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        return _buildPage(context);
      default:
        return Container();
    }
  }

  Widget _buildPage(BuildContext context) => Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: ListView(
        children: [_buildImage(_imageList), _buildButtons(_imageList)],
      ));

  Container _buildButtons(List<String> data) {
    final List<Widget> widgets = [_buildConfirmButton()];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: widgets,
      ),
    );
  }

  Widget _buildConfirmButton() => ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        fixedSize:
            MaterialStateProperty.resolveWith((states) => const Size(120, 40)),
        backgroundColor:
            MaterialStateProperty.resolveWith((states) => Colors.white),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            side: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(50))),
      ),
      onPressed: () => Fluttertoast.showToast(msg: '确认选择'),
      child: const Text(
        '确认选择',
        style: TextStyle(color: Colors.grey, fontSize: 17),
      ));

  Widget _buildImage(List<String> data) {
    // if (data.isNotEmpty) {
    final Widget container = Container(child: LayoutBuilder(
      builder: (context, constraints) {
        print('$constraints');
        return Container(
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              cacheExtent: 135,
              itemCount: _imageList.length + 1,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  crossAxisCount: 3,
                  //横轴三个子widget
                  childAspectRatio: 240 / 320 //宽高比为1时，子widget
                  ),
              itemBuilder: (context, index) =>
                  _buildItems(index, _imageList.length + 1)),
        );
      },
    ));

    return container;
  }

  Widget _buildItems(int index, int count) {
    Widget _widget;

    if (index + 1 == count) {
      _widget = _buildCustomImageButton();
    } else {
      _widget = _buildImageItem(index);
    }

    return _widget;
  }

  Container _buildImageItem(int index) => Container(
      width: 240,
      height: 320,
      child: ImageItem(
        _imageList[index],
        _currentSelectedImageUrl,
        onTapped: () => {
          _currentSelectedImageUrl = _imageList[index],
          Fluttertoast.showToast(msg: '$index')
        },
      ));

  Widget _buildCustomImageButton() => InkWell(
        onTap: () => Fluttertoast.showToast(msg: 'add item'),
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.lightBlueAccent),
                borderRadius: BorderRadius.circular(5)),
            child: const Icon(Icons.add, size: 60, color: Colors.grey)),
      );

  @override
  set imageList(List<String> data) {
    setState(() {
      _imageList = data;
    });
  }
}
