import 'package:banking_flutter_app/screens/credit.dart';
import 'package:banking_flutter_app/screens/home.dart';
import 'package:banking_flutter_app/screens/solde_history_home.dart';
import 'package:banking_flutter_app/screens/transfer.dart';
import 'package:flutter/material.dart';

class Routes {
  final Map<String, WidgetBuilder> _routes = {
    '/': (context) => const MyHomePage(),
    '/transfer': (context) => const MyTransferPage(),
    '/credit': (context) => const MyAddTransactionPage(),
    '/home': (context) => const SoldeHistoryHome(),
  };

  Map<String, WidgetBuilder> getRoutes() => _routes;
}
