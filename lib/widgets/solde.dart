import 'package:flutter/material.dart';

class SoldePage extends StatefulWidget {
  const SoldePage({super.key});
  @override
  _soldePageState createState() => _soldePageState();
}

class _soldePageState extends State<SoldePage> {
  void _addMoney() {}

  void _transfert() {}
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Container(
                child: Center(
                  child: Column(
                    children: [
                      Text("Balance"),
                      Text(
                        "7,172.85",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: _addMoney,
                            child: Text("ADD MONEY"),
                          ),
                          ElevatedButton(
                            onPressed: _transfert,
                            child: Text("Transfert"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )));
  }
}
