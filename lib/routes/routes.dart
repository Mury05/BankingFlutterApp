// import 'package:banking_flutter_app/screens/home.dart';
import 'package:banking_flutter_app/screens/solde_history_home.dart';
import 'package:flutter/material.dart';

class Routes {
  final Map<String, WidgetBuilder> _routes = {
    '/': (context) => const SoldeHistoryHome(),
  };

  Map<String, WidgetBuilder> getRoutes() => _routes;
}
