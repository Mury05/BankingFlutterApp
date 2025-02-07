import 'package:banking_flutter_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        // textTheme: GoogleFonts.playfairDisplayTextTheme(),
        textTheme: GoogleFonts.montserratTextTheme(), 
      ),
      initialRoute: '/home',
      routes: Routes().getRoutes(),
    );
  }
}
