import 'package:banking_flutter_app/widgets/card.dart';
import 'package:banking_flutter_app/widgets/footer_icon.dart';
import 'package:banking_flutter_app/widgets/navigation.dart';
import 'package:banking_flutter_app/widgets/solde.dart';
import 'package:flutter/material.dart';

class SoldeHistoryHome extends StatelessWidget {
  const SoldeHistoryHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Michelle Anderson"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SoldePage(),
            CardPage(),
            CardPage(),
            CardPage(),
            Text("TRANSLATIONS"),
            NavigationPage(),
            NavigationPage(),
            NavigationPage(),
            NavigationPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.window,
                color: Colors.green,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.videocam,
                color: Colors.green,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
                color: Colors.green,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: Colors.green,
              ),
              label: ''),
        ]));
  }
}
