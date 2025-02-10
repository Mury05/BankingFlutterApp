import 'package:banking_flutter_app/controllers/transactionscontroller.dart';
import 'package:banking_flutter_app/models/transactions.dart';
import 'package:banking_flutter_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:banking_flutter_app/widgets/transactions.dart';
import '../models/user.dart';

class MyTransferPage extends StatefulWidget {
  const MyTransferPage({super.key});

  @override
  State<MyTransferPage> createState() => _MyTransferPageState();
}

class _MyTransferPageState extends State<MyTransferPage> {
  String amount = "5.00";
  String selectedContact = users[0].username; // Par défaut, un contact sélectionné
  final Transactions _transactions = Transactions();
  String? selectedCard;

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

  void sendMoney() {
    double transferAmount = double.tryParse(amount) ?? 0.00;

    if (selectedContact.isEmpty) {
      showMessage(
          "Please select a contact before proceeding.", Colors.red, context);
      return;
    }
    if (selectedCard == null) {
      showMessage(
          "Please select a card before proceeding.", Colors.red, context);
      return;
    }

    if (transferAmount != 0) {
      final transaction = Transaction(
        amount: double.parse(amount),
        date: DateTime.now(),
        type: 'debit',
        receiver: selectedContact,
        cardType: selectedCard!,
      );

      bool result = _transactions.addTransaction(transaction);

      if (!result) {
        showMessage("Insufficient funds on the ${transaction.cardType}.",
            Colors.red, context);
        return;
      } else {
        setState(() {});
        showMessage(
            "Transaction successful! Sent \$$transferAmount to $selectedContact.",
            Colors.green,
            context);
        Navigator.pushNamed(context, '/home');
      }
    } else {
      showMessage("Invalid amount. Please enter a valid amount greater than 0.",
          Colors.red, context);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Transfer Money",
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
          const SizedBox(height: 30),

          // Liste de contacts
          SizedBox(
            height: 110,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      User user = users[index];
                      return ContactItem(
                          imagePath: "R.jpg",
                          name: user.username,
                          isSelected: selectedContact == user.username,
                          onTap: () {
                            setState(() {
                              selectedContact = user.username;
                            });
                          });
                    },
                  )),
                ],
              ),
            ),
          ),

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
      bottomNavigationBar: GestureDetector(
        onTap: sendMoney,
        child: Container(
          width: double.infinity,
          height: 70,
          color: const Color.fromARGB(255, 32, 59, 35),
          child: Center(
            child: Text(
              "SEND \$$amount >",
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
