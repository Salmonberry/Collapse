import 'package:collapse/collapse.dart';
import 'package:flutter/material.dart';

class FlutterEnvironmentPage extends StatelessWidget {
  const FlutterEnvironmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('FlutterEnvironmentPage'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: const [ButtonsPanel(), GridViewLayout()],
          ),
        ));
  }
}
