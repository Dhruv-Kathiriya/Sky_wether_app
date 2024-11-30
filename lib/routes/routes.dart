import 'package:flutter/material.dart';

import '../view/screens/homepage/homepage.dart';
import '../view/screens/splashscreen/spalsh.dart';

class Routes {
  static const String splash = '/';
  static const String home = 'home';

  static Map<String, WidgetBuilder> myRoutes = {
    splash: (context) => const SplashScreen(),
    home: (context) => const HomePage(),
  };
}
