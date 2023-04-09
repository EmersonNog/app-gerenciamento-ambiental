import 'package:flutter/cupertino.dart';
import 'package:safecity/pages/about.dart';
import 'package:safecity/pages/home.dart';
import 'package:safecity/pages/introduction.dart';
import 'package:safecity/pages/map.dart';

class Routes {
  static Map<String, Widget Function(BuildContext context)> routes = <String, WidgetBuilder>{
    '/inicio': (context) => const Home(),
    '/mapa': (context) => Mapa(),
    '/introducao': (context) => const Introduction(),
    '/sobre': (context) => const About(),
  };

  static String initialRoute = '/inicio';
}