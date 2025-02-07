// import 'package:banking_flutter_app/screens/home.dart';
import 'package:banking_flutter_app/screens/auth/login.dart';
import 'package:banking_flutter_app/screens/auth/register.dart';
import 'package:banking_flutter_app/screens/solde_history_home.dart';
import 'package:flutter/material.dart';

class Routes {
  final Map<String, WidgetBuilder> _routes = {
    '/': (context) => const LoginPage(),
    '/login': (context) => const LoginPage(),
    '/register': (context) => const RegisterPage(),
    '/solde': (context) => const SoldeHistoryHome(),
  };

  Map<String, WidgetBuilder> getRoutes() => _routes;
}
