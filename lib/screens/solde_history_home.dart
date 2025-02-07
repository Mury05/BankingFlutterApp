import 'package:banking_flutter_app/widgets/card.dart';
import 'package:banking_flutter_app/widgets/translation.dart';
import 'package:banking_flutter_app/widgets/solde.dart';
import 'package:flutter/material.dart';

class SoldeHistoryHome extends StatelessWidget {
  const SoldeHistoryHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Michelle Anderson"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.qr_code),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SoldePage(
                balance: "7,172.85",
              ),
              CardPage(
                cardType: 'Primary Card',
                firstAmount: '+\$7289',
                secondAmount: '\$2,874.85',
              ),
              CardPage(
                cardType: 'Secondary deby Card',
                firstAmount: '+\$8623',
                secondAmount: '\$4,288.00',
              ),
              Text("TRANSLATIONS"),
              TranslationPage(
                name: "Pratick Smithson",
                amount: "-\$120.00",
                date: "Yesterday , 12:58 pm",
                icon: Icons.set_meal,
              ),
              TranslationPage(
                name: "Aristide",
                amount: "+\$20.00",
                date: "Today , 18:00 pm",
                icon: Icons.get_app,
              ),
              TranslationPage(
                name: "Mury",
                amount: "-\$1.00",
                date: "now",
                icon: Icons.money,
              ),
              TranslationPage(
                name: "Léger",
                amount: "-\$120.00",
                date: "Yesterday , 12:58 pm",
                icon: Icons.set_meal,
              ),
            ],
          ),
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
