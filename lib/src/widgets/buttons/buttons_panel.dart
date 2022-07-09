import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ButtonsPanel extends StatelessWidget {
  const ButtonsPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Wrap(
        spacing: 10,
        children: [
          buildBorderOutlinedButton01(),
          buildBorderOutlinedButton02(),
          buildNoneBorderButton(),
          buildInkButton()
        ],
      );

  /// 使用OutlinedButton构建边框线的按钮, 能有墨水效果
  OutlinedButton buildBorderOutlinedButton01() {
    return OutlinedButton(
        onPressed: () {
          Fluttertoast.showToast(msg: 'Hello');
        },
        style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            primary: Colors.black26,
            fixedSize: const Size(130, 44),
            side: const BorderSide(width: 1.0, color: Colors.orange),
            shape: const StadiumBorder()),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Text(
            '重试',
            style: TextStyle(fontSize: 17, color: Colors.orange),
          ),
        ));
  }

  /// 使用ElevatedButton构建的边框线按钮 无墨水效果
  Widget buildBorderOutlinedButton02() => ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        fixedSize:
            MaterialStateProperty.resolveWith((states) => const Size(120, 40)),
        backgroundColor:
            MaterialStateProperty.resolveWith((states) => Colors.white),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            side: const BorderSide(color: Colors.orange),
            borderRadius: BorderRadius.circular(50))),
      ),
      onPressed: () {
        Fluttertoast.showToast(msg: 'Hello');
      },
      child: const Text(
        '确认选择',
        style: TextStyle(color: Colors.orange, fontSize: 17),
      ));

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
              Fluttertoast.showToast(msg: 'Hello');
            },
            splashColor: Colors.lightBlue,
            child: Container(
              width: 80,
              height: 30,
              alignment: Alignment.center,
              child: const Text(
                '连接',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      );

  /// 无边框按钮
  Widget buildNoneBorderButton() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
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
              Fluttertoast.showToast(msg: 'Hello');
            },
            child: const Text(
              ' 从本地选择',
              style: TextStyle(color: Colors.white, fontSize: 17),
            )),
      );
}
