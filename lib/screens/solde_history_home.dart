import 'package:banking_flutter_app/models/transactions.dart';
import 'package:banking_flutter_app/widgets/card.dart';
import 'package:banking_flutter_app/widgets/translation.dart';
import 'package:banking_flutter_app/widgets/solde.dart';
import 'package:flutter/material.dart';

class SoldeHistoryHome extends StatefulWidget {
  const SoldeHistoryHome({super.key});

  @override
  State<SoldeHistoryHome> createState() => _SoldeHistoryHomeState();
}

class _SoldeHistoryHomeState extends State<SoldeHistoryHome> {
  final Transactions _transactions = Transactions();

  @override
  void initState() {
    super.initState();
    _initializeTransactions();
  }

 void _initializeTransactions() {
  void addWithCheck(Transaction transaction) {
    bool result = _transactions.addTransaction(transaction);
    
    if (!result) {
     WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Fonds insuffisants sur la carte ${transaction.cardType}", style: TextStyle(color: Colors.white, fontFamily: "Roboto")),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 5),
          ),
        );
         });
    } else {
      setState(() {}); // Mise à jour de l'UI si la transaction est ajoutée
    }
  }

  addWithCheck(Transaction(
    amount: 250.00,
    date: DateTime.now().subtract(const Duration(days: 1)),
    type: 'credit',
    receiver: "Pratick Smithson",
    cardType: 'Primary Card',
  ));

  addWithCheck(Transaction(
    amount: 2000.00,
    date: DateTime.now(),
    type: 'credit',
    receiver: "Avery Smithson",
    cardType: 'Secondary Card',
  ));

  addWithCheck(Transaction(
    amount: 200.00,
    date: DateTime.now(),
    type: 'debit',
    receiver: "Bright Line",
    cardType: 'Primary Card',
  ));
}


  @override
  Widget build(BuildContext context) {
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
            // 🔹 Affichage du solde total
            SoldePage(balance: _transactions.totalBalance.toString()),

            const SizedBox(height: 20),
            const Divider(),

            // 🔹 Affichage des cartes
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CardPage(
                    cardType: 'Primary Card',
                    firstAmount: '+\$7289',
                    secondAmount: '\$${_transactions.getBalanceByCardType('Primary Card')}',
                  ),
                  const SizedBox(height: 10),
                  CardPage(
                    cardType: 'Secondary Card',
                    firstAmount: '+\$8623',
                    secondAmount: '\$${_transactions.getBalanceByCardType('Secondary Card')}',
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

            // 🔹 Liste scrollable des transactions
            Expanded(
              child: ListView.builder(
                itemCount: _transactions.transactions.length,
                itemBuilder: (context, index) {
                  final transaction = _transactions.transactions[index];

                  return TranslationPage(
                    name: transaction.receiver,
                    amount: transaction.type == 'credit'
                        ? "+\$${transaction.amount}"
                        : "-\$${transaction.amount}",
                    date: "${transaction.date}",
                    icon: transaction.type == 'credit'
                        ? Icons.get_app
                        : Icons.money_off,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
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
