import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ButtonsPanel extends StatefulWidget {
  const ButtonsPanel({Key? key}) : super(key: key);

  @override
  State<ButtonsPanel> createState() => _ButtonsPanelState();
}

class _ButtonsPanelState extends State<ButtonsPanel> {

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
        title: const Text('Buttons Panel')),
        body: Container(
          constraints: const BoxConstraints.expand(),
          padding: const EdgeInsets.only(top: 20),
          child: ListView(
            children: [
              buildBorderOutlinedButton01(),
              buildBorderOutlinedButton02(),
              buildNoneBorderButton(),
              buildInkButton()
            ],
          ),
        ),
      );

  /// OutlinedButton 边框线按钮 墨水效果
  OutlinedButton buildBorderOutlinedButton01() {
    return OutlinedButton(
        onPressed: () {
          Fluttertoast.showToast(msg: 'OutlinedButton 边框线 按钮 墨水效果');
        },
        style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            primary: Colors.black26,
            fixedSize: const Size(200, 44),
            side: const BorderSide(width: 1.0, color: Colors.orange),
            shape: const StadiumBorder()),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Text(
            '边框线按钮',
            style: TextStyle(fontSize: 17, color: Colors.orange),
          ),
        ));
  }

  /// 使用ElevatedButton构建的边框线按钮 无墨水效果
  Widget buildBorderOutlinedButton02() => ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        fixedSize:
            MaterialStateProperty.resolveWith((states) => const Size(200, 40)),
        backgroundColor:
            MaterialStateProperty.resolveWith((states) => Colors.white),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            side: const BorderSide(color: Colors.orange),
            borderRadius: BorderRadius.circular(50))),
      ),
      onPressed: () {
        Fluttertoast.showToast(msg: 'ElevatedButton 边框线按钮 无墨水效果');
      },
      child: const Text(
        '边框线按钮',
        style: TextStyle(color: Colors.orange, fontSize: 17),
      ));

  /// ElevatedButton 无边框按钮
  Widget buildNoneBorderButton() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              fixedSize: MaterialStateProperty.resolveWith(
                  (states) => const Size(200, 10)),
              backgroundColor:
                  MaterialStateProperty.resolveWith((states) => Colors.green),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50))),
            ),
            onPressed: () {
              Fluttertoast.showToast(msg: 'ElevatedButton 无边框按钮');
            },
            child: const Text(
              '无边框按钮',
              style: TextStyle(color: Colors.white, fontSize: 17),
            )),
      );

  /// 自定义墨水效果按钮
  Widget buildInkButton() => Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(50),
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.green, // 背景色
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(50),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () {
              Fluttertoast.showToast(msg: '自定义墨水效果按钮');
            },
            splashColor: Colors.lightBlue,
            child: Container(
              width: 200,
              height: 50,
              alignment: Alignment.center,
              child: const Text(
                '自定义墨水效果按钮',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      );
}
