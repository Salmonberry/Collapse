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
          color: Colors.amber,
          child: const Text('Environment'),
        ));
  }
}
