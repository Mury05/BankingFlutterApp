import 'package:banking_flutter_app/screen/home.dart';
import 'package:flutter/material.dart';

class Routes {
  final Map<String, WidgetBuilder> _routes = {
    '/': (context) => const MyHomePage(),
  };

  Map<String, WidgetBuilder> getRoutes() => _routes;

}
