import 'package:banking_flutter_app/screens/add.dart';
import 'package:banking_flutter_app/screens/home.dart';
import 'package:banking_flutter_app/screens/transfer.dart';
import 'package:flutter/material.dart';

class Routes {
  final Map<String, WidgetBuilder> _routes = {
    '/': (context) => const MyHomePage(),
    '/transfer': (context) => const MyTransferPage(),
    '/add': (context) => const MyAddTransactionPage(),
  };

  Map<String, WidgetBuilder> getRoutes() => _routes;

}
