import 'package:collapse/collapse.dart';
import 'package:example/flutter_envirment/flutter_environment_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'config/router/service_navigator.dart';
import 'config/service_locator.dart';
import 'home/home.dart';

final getIt = GetIt.instance;

void main() {
  init();
  runApp(const MyApp());
}

init() {
  LocatorService.setupLocator(getIt);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: getIt<NavigatorService>().key,
      title: 'Flutter Demo',
      initialRoute: "/",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const MyHomePage(title: 'Home'),
        '/flutter_environment_page': (
            context) => const FlutterEnvironmentPage(),
        '/input_widgets': (context) =>const InputWidgets(),
      },
    );
  }
}
