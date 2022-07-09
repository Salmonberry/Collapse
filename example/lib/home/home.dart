import 'package:example/config/router/service_navigator.dart';
import 'package:example/main.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Wrap(
            spacing: 5,
            children: <Widget>[
              _buildItem('Buttons', Icons.add, '/flutter_environment_page'),
              _buildItem('Inputs', Icons.ac_unit_rounded, '/input_widgets'),
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget _buildItem(String title, IconData? iconData, String routerName) =>
      Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            InkWell(
              // onPressed: () => Navigator.pushNamed(context, '/flutter_environment_page'),
              onTap: () => getIt<NavigatorService>().pushNamed(routerName),
              child: Icon(iconData),
            ),
            Text(title)
          ],
        ),
      );
}
