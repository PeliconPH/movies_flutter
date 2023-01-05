import 'package:flutter/cupertino.dart';
import 'package:movies_flutter/navigation/di/navigation_factory.dart';

class MobileRouter {
  static const String initialRoute = NavigationFactory.route;

  static final Map<String, WidgetBuilder> routes = {
    NavigationFactory.route: (_) => NavigationFactory.navigation(),
  };
}
