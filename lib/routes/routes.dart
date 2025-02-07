import 'package:banking_flutter_app/screens/credit.dart';
import 'package:banking_flutter_app/screens/home.dart';
import 'package:banking_flutter_app/screens/auth/login.dart';
import 'package:banking_flutter_app/screens/auth/register.dart';
import 'package:banking_flutter_app/screens/solde_history_home.dart';
import 'package:banking_flutter_app/screens/transfer.dart';
import 'package:flutter/material.dart';

class Routes {
  final Map<String, WidgetBuilder> _routes = {
    '/': (context) => const MyHomePage(),
    '/debit': (context) => const MyTransferPage(),
    '/credit': (context) => const MyAddTransactionPage(),
    '/home': (context) => const SoldeHistoryHome(),
    '/login': (context) => const LoginPage(),
    '/register': (context) => const RegisterPage(),
  };

  Map<String, WidgetBuilder> getRoutes() => _routes;
}
