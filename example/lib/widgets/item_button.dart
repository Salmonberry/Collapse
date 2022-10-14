import 'package:example/config/router/service_navigator.dart';
import 'package:example/home/domain/home_item_entity.dart';
import 'package:example/main.dart';
import 'package:example/res/dimens.dart';
import 'package:flutter/material.dart';

class ItemButton extends StatelessWidget {
  final HomeItemEntity data;

  const ItemButton(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => getIt<NavigatorService>().pushNamed(data.routerName),
        child: Container(
          width: AppDimens.dimen100,
          height: AppDimens.dimen100,
          padding: const EdgeInsets.all(AppDimens.dimen20),
          decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(AppDimens.dimen10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(data.iconData),
              const SizedBox(height: 10),
              Text(data.title)
            ],
          ),
        ),
      );
}
