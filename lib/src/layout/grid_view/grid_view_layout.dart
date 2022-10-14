import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class GridViewLayout extends StatefulWidget {
  const GridViewLayout({Key? key}) : super(key: key);

  @override
  State<GridViewLayout> createState() => _GridViewLayoutState();
}

class _GridViewLayoutState extends State<GridViewLayout> {
  final List<String> _imageList = [
    'https://nb-web-www.naiveblue.com/www-nb/20210531/a54y3OBXdZna.png!w640.jpg',
    'https://cdn.jsdelivr.net/gh/Salmonberry/FigureBedBySalmon@master/資源圖/QQ20220607-0.3qsm8okfvo80.jpg',
    'https://cdn.jsdelivr.net/gh/Salmonberry/FigureBedBySalmon@master/資源圖/迪卢克凯亚.2atzy9e6tekg.jpg',
    'https://cdn.jsdelivr.net/gh/Salmonberry/FigureBedBySalmon@master/資源圖/甘雨魈刻晴.3uksketwjzo0.jpg',
    'https://cdn.jsdelivr.net/gh/Salmonberry/FigureBedBySalmon@master/資源圖/可莉阿贝多webp.3gzbuc3aptk0.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid View Layout'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          print('$constraints');
          return GridView.builder(
              shrinkWrap: true,
              cacheExtent: 135,
              itemCount: _imageList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  crossAxisCount: 3,
                  //横轴三个子widget
                  childAspectRatio: 1.0 //宽高比为1时，子widget
                  ),
              itemBuilder: (context, index) => SizedBox(
                    width: 135,
                    height: 135,
                    child: _imageItem(
                      _imageList[index],
                    ),
                  ));
        },
      ),
    );
  }

  Widget _imageItem(String url) => InkWell(
      onTap: () {
        Fluttertoast.showToast(msg: 'Hello');
      },
      borderRadius: BorderRadius.circular(5),
      child: Stack(children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              width: 135,
              height: 135,
              placeholder: (context, url) => Center(
                child: LoadingAnimationWidget.beat(
                  color: Colors.white,
                  size: 100,
                ),
              ),
              imageUrl: url,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              alignment: Alignment.center,
              fit: BoxFit.cover,
            ))
      ]));
}
