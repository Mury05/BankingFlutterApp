import 'package:banking_flutter_app/controllers/transactionscontroller.dart';
import 'package:banking_flutter_app/models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:banking_flutter_app/widgets/transactions.dart';

class MyAddTransactionPage extends StatefulWidget {
  const MyAddTransactionPage({super.key});

  @override
  State<MyAddTransactionPage> createState() => _MyAddTransactionPageState();
}

class _MyAddTransactionPageState extends State<MyAddTransactionPage> {
  String amount = "5.00";
  String? selectedCard;
  final Transactions _transactions =
      Transactions(); // Assurez-vous que cette classe existe.

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedCard = ModalRoute.of(context)!.settings.arguments as String?;
  }

  void addNumber(String number) {
    setState(() {
      if (amount == "0.00") {
        amount = number;
      } else {
        amount += number;
      }
    });
  }

  void deleteNumber() {
    setState(() {
      if (amount.length > 1) {
        amount = amount.substring(0, amount.length - 1);
      } else {
        amount = "0.00";
      }
    });
  }

  void _creditCard() {
    if (selectedCard == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Please select a card before proceeding.",
            style: TextStyle(color: Colors.white, fontFamily: "Roboto"),
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }
    if (double.parse(amount) != 0) {
      final transaction = Transaction(
        amount: double.parse(amount),
        date: DateTime.now(),
        type: 'credit',
        cardType: selectedCard!,
      );

      bool result = _transactions.addTransaction(transaction);

      if (!result) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Insufficient funds on the ${transaction.cardType}.",
              style: TextStyle(color: Colors.white, fontFamily: "Roboto"),
            ),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
      } else {
        setState(() {});
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Transaction successful on your ${transaction.cardType}.",
              style: TextStyle(color: Colors.white, fontFamily: "Roboto"),
            ),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
          ),
        );
        Navigator.pushNamed(context, '/home');
      }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Please enter a valid amount greater than 0.",
              style: TextStyle(color: Colors.white, fontFamily: "Roboto"),
            ),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Add Money",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          const Spacer(),

          // Affichage du montant
          Center(
            child: Text(
              "\$$amount",
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const Spacer(),

          // Montants rapides
          Wrap(
            spacing: 15,
            children: [
              QuickAmountButton(
                  value: "5", onPressed: () => setState(() => amount = "5.00")),
              QuickAmountButton(
                  value: "10",
                  onPressed: () => setState(() => amount = "10.00")),
              QuickAmountButton(
                  value: "20",
                  onPressed: () => setState(() => amount = "20.00")),
              QuickAmountButton(
                  value: "50",
                  onPressed: () => setState(() => amount = "50.00")),
              QuickAmountButton(
                  value: "100",
                  onPressed: () => setState(() => amount = "100.00")),
            ],
          ),

          const SizedBox(height: 20),
          const Divider(),

          // Clavier numérique
          NumPad(onNumberTap: addNumber, onDelete: deleteNumber),
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: _creditCard,
        child: Container(
          width: double.infinity,
          height: 70,
          color: const Color.fromARGB(255, 32, 59, 35),
          child: Center(
            child: Text(
              "ADD \$$amount >",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
