import 'package:flutter/material.dart';
import 'package:banking_flutter_app/widgets/transactions.dart';

class MyAddTransactionPage extends StatefulWidget {
  const MyAddTransactionPage({super.key});

  @override
  State<MyAddTransactionPage> createState() => _MyAddTransactionPageState();
}

class _MyAddTransactionPageState extends State<MyAddTransactionPage> {
  String amount = "5.00";

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
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          // const SizedBox(height: 30),

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
                  value: "5",
                  onPressed: () {
                    setState(() {
                      amount = "5.00";
                    });
                  }),
              QuickAmountButton(
                  value: "10",
                  onPressed: () {
                    setState(() {
                      amount = "10.00";
                    });
                  }),
              QuickAmountButton(
                  value: "20",
                  onPressed: () {
                    setState(() {
                      amount = "20.00";
                    });
                  }),
              QuickAmountButton(
                  value: "50",
                  onPressed: () {
                    setState(() {
                      amount = "50.00";
                    });
                  }),
              QuickAmountButton(
                  value: "100",
                  onPressed: () {
                    setState(() {
                      amount = "100.00";
                    });
                  }),
            ],
          ),

          const SizedBox(height: 20),
          const Divider(),

          // Clavier numérique
          NumPad(
            onNumberTap: addNumber,
            onDelete: deleteNumber,
          ),
        ],
      ),

      bottomNavigationBar: // Bouton "SEND"
          Container(
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
    );
  }
}

