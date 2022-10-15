import 'package:Collapse/config/router/service_navigator.dart';
import 'package:get_it/get_it.dart';

 class  LocatorService {

LocatorService();

  static void setupLocator(GetIt instance) {
    instance.registerSingleton<NavigatorService>(NavigatorService());
  }
}
