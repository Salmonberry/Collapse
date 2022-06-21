import 'package:flutter/material.dart';

class NavigatorService {
  final GlobalKey<NavigatorState> key = GlobalKey(debugLabel: 'navigate_key');

  NavigatorState? get navigator => key.currentState;

  get pushNamed => navigator?.pushNamed;
  get push => navigator?.push;

  NavigatorService();


}
