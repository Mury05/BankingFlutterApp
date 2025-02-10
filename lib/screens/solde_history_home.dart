import 'package:banking_flutter_app/controllers/transactionscontroller.dart';
import 'package:banking_flutter_app/widgets/card.dart';
import 'package:banking_flutter_app/widgets/translation.dart';
import 'package:banking_flutter_app/widgets/solde.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  }

  String formatTransactionDate(DateTime date) {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat.jm().format(date); // "12:00 PM"

    if (DateUtils.isSameDay(now, date)) {
      return "Today, $formattedTime";
    } else if (DateUtils.isSameDay(now.subtract(Duration(days: 1)), date)) {
      return "Yesterday, $formattedTime";
    } else {
      return DateFormat('EEEE, MMM d, yyyy – $formattedTime')
          .format(date); // Exemple: "Monday, Feb 5, 2025 – 12:00 PM"
    }
  }

  Future<bool?> _showConfirmDeleteDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete Transaction"),
          content: Text("Are you sure you want to delete this transaction?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false), // Annuler
              child: Text("Cancel", style:  TextStyle(color: Colors.green),),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true), // Confirmer
              child: Text("Delete", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
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
                    firstAmount: '****************7289',
                    secondAmount:
                        '\$${_transactions.getBalanceByCardType('Primary Card')}',
                  ),
                  const SizedBox(height: 10),
                  CardPage(
                    cardType: 'Secondary Card',
                    firstAmount: '****************5670',
                    secondAmount:
                        '\$${_transactions.getBalanceByCardType('Secondary Card')}',
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

                  return Dismissible(
                    key: Key(transaction.id), // Identifiant unique
                    direction:
                        DismissDirection.endToStart, // Swipe de droite à gauche
                    // confirmDismiss: (direction) async {
                    //   return await _showConfirmDeleteDialog(context);
                    // },
                    onDismissed: (direction) {
                      setState(() {
                        _transactions.removeTransaction(transaction.id);
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green.shade500,
                          content: Text(
                            "Transaction deleted",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          action: SnackBarAction(
                            // backgroundColor: Colors.red.shade800,
                            textColor: Colors.white,
                            label: "Undo",
                            onPressed: () {
                              setState(() {
                                _transactions.addTransaction(transaction);
                              });
                            },
                          ),
                        ),
                      );
                    },
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                    child: TranslationPage(
                      type: transaction.type,
                      name: transaction.receiver ?? "My Transaction",
                      amount: transaction.type == 'credit'
                          ? "+\$${transaction.amount}"
                          : "-\$${transaction.amount}",
                      date: formatTransactionDate(transaction.date),
                      icon: transaction.type == 'credit'
                          ? Icons.trending_up
                          : Icons.trending_down,
                      color: transaction.type == 'credit'
                          ? Colors.green
                          : Colors.red,
                    ),
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
