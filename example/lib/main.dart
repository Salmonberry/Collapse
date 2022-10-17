import 'package:Collapse/layout/grid_list_page.dart';
import 'package:Collapse/layout/tab_list_page.dart';
import 'package:collapse/collapse.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'config/router/service_navigator.dart';
import 'config/service_locator.dart';
import 'home/home.dart';
import 'layout/layout_list_page.dart';

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
        primarySwatch: Colors.grey,
        appBarTheme:const AppBarTheme(elevation: 0)
      ),
      routes: {
        '/': (context) => const MyHomePage(),
        '/buttons_panel': (context) => const ButtonsPanel(),
        '/input_widgets': (context) => const InputWidgetsPanel(),
        '/layout': (context) => const LayoutListPage(),
        '/grid_view_list_page': (context) => const GridListPage(),
        '/grid_view_layout': (context) => const GridViewLayoutPage(),
        '/grid_view_column': (context) => const GridViewColumnPage(),
        '/tab_list_page': (context) => const TabListPage(),
        '/tab_bar_and_tab_bar_view_page':(context)=> const TabBarAndTabBarViewPage(),
        '/tab_bar_and_offstage_page':(context)=> const TabBarAndOffstagePage(),
        '/test': (context) => const InputWidgetsPanel(),
      },
    );
  }
}
