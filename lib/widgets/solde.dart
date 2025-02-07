import 'package:banking_flutter_app/widgets/selectedcard.dart';
import 'package:flutter/material.dart';

class SoldePage extends StatefulWidget {
  final String balance;

  const SoldePage({super.key, required this.balance});

  @override
  // ignore: library_private_types_in_public_api
  _soldePageState createState() => _soldePageState();
}

// ignore: camel_case_types
class _soldePageState extends State<SoldePage> {
  String? selectedCardType;

  void _addMoney() {
    _openCardSelectionModal('/add');
  }

  void _transfert() {
    _openCardSelectionModal('/transfer');
  }

  void _openCardSelectionModal(String route) async {
    final List<String> cardTypes = [
      "Primary Card",
      "Secondary Debit Card",
    ];

    String? selected = await showModalBottomSheet<String>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white, // Couleur de fond du modal
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Select Card Type",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[900]),
              ),
              SizedBox(height: 10),
              // Séparateur
              Divider(color: Colors.grey.shade400),
              SizedBox(height: 10),
              ...cardTypes.map((type) => ListTile(
                    title: Text(
                      type,
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () => Navigator.pop(context, type),
                    trailing: Icon(Icons.arrow_forward,
                        color:
                            Colors.green[900]), // Icône pour indiquer l'action
                  )),
            ],
          ),
        );
      },
    );

    if (selected != null) {
      setState(() {
        selectedCardType = selected;
        print(selectedCardType);
        Navigator.pushNamed(context, route);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Column(
              children: [
                Text(
                  "Balance",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "\$${widget.balance}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      // width: 50,
                      child: ElevatedButton(
                        onPressed: _addMoney,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 22, vertical: 15),
                        ),
                        child: Text(
                          "ADD MONEY",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    SizedBox(
                      child: ElevatedButton(
                        onPressed: _transfert,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 22, vertical: 15),
                        ),
                        child: Text(
                          "TRANSFERT",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
