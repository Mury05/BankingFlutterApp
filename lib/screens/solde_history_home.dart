import 'package:banking_flutter_app/widgets/card.dart';
import 'package:banking_flutter_app/widgets/translation.dart';
import 'package:banking_flutter_app/widgets/solde.dart';
import 'package:flutter/material.dart';

class SoldeHistoryHome extends StatelessWidget {
  const SoldeHistoryHome({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> transactions = [
      {
        "name": "Pratick Smithson",
        "amount": "-\$120.00",
        "date": "Yesterday, 12:58 PM",
        "icon": Icons.set_meal,
      },
      {
        "name": "Aristide",
        "amount": "+\$20.00",
        "date": "Today, 18:00 PM",
        "icon": Icons.get_app,
      },
      {
        "name": "Mury",
        "amount": "-\$1.00",
        "date": "Now",
        "icon": Icons.money,
      },
      {
        "name": "Léger",
        "amount": "-\$120.00",
        "date": "Yesterday, 12:58 PM",
        "icon": Icons.set_meal,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Michelle Anderson",
          style: TextStyle(fontSize: 15),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: const Icon(Icons.qr_code),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SoldePage(balance: "7,172.85"),
            const SizedBox(height: 20),
            const Divider(),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CardPage(
                    cardType: 'Primary Card',
                    firstAmount: '+\$7289',
                    secondAmount: '\$2,874.85',
                  ),
                  const SizedBox(height: 10),
                  CardPage(
                    cardType: 'Secondary Debit Card',
                    firstAmount: '+\$8623',
                    secondAmount: '\$4,288.00',
                  ),
                ],
              ),
            ),

            const Divider(),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("TRANSACTIONS"),
            ),

            // Liste scrollable des transactions
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  return TranslationPage(
                    name: transactions[index]['name'],
                    amount: transactions[index]['amount'],
                    date: transactions[index]['date'],
                    icon: transactions[index]['icon'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Fixe l'alignement des éléments
        backgroundColor:
            Colors.white, // Ajoute une couleur de fond pour le contraste
        selectedFontSize: 0, // Supprime l’espace inutile sous les icônes
        unselectedFontSize: 0,
        selectedItemColor: Colors.green, // Couleur de l’icône sélectionnée
        unselectedItemColor:
            Colors.grey, // Couleur des icônes non sélectionnées
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.window),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.track_changes),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
      ),
    );
  }
}
