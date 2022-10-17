import 'package:collapse/src/layout/grid_view/grid_view_column/widgets/setting.dart';
import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  final Setting setting;
  final void Function()? onTapped;

  const SettingItem(this.setting, {this.onTapped});

  @override
  Widget build(BuildContext context) => InkWell(
      onTap: onTapped,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 25),
        decoration: BoxDecoration(
            // image: DecorationImage(
            //     image: ExactAssetImage(
            //       setting.background,
            //     )),
            color: setting.background,
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(offset: Offset(8, 10), color: Colors.black26)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.only(top: 5),
                width: 40,
                height: 40,
                // child: Image.asset(setting.icon)),
                child: Icon(setting.icon)),
            const SizedBox(height: 10),
            Text(
              setting.title,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ));
}
