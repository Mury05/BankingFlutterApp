import 'package:flutter/material.dart';

class SoldePage extends StatefulWidget {
  final String balance;

  const SoldePage({super.key, required this.balance});

  @override
  _SoldePageState createState() => _SoldePageState();
}

class _SoldePageState extends State<SoldePage>
    with SingleTickerProviderStateMixin {
  String? selectedCardType;
  double _animatedBalance = 0.0; // Valeur pour l'animation
  late AnimationController _controller; // Contrôleur d'animation

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000), // Durée de l'animation
    )..addListener(() {
        setState(() {
          // Met à jour la valeur animée
          _animatedBalance = double.parse(widget.balance) * _controller.value;
        });
      });
    _controller.forward(); // Démarre l'animation
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose le contrôleur d'animation
    super.dispose();
  }

  void _addMoney() {
    _openCardSelectionModal('/credit');
  }

  void _transfert() {
    _openCardSelectionModal('/debit');
  }

  void _openCardSelectionModal(String route) async {
    final List<String> cardTypes = [
      "Primary Card",
      "Secondary Card",
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
        Navigator.pushNamed(context, route, arguments: selectedCardType);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
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
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade900,
                  ),
                ),
                SizedBox(height: 10),
                // Affichage du solde avec animation
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Text(
                      "\$${_animatedBalance.toStringAsFixed(2)}", // Affiche le montant formaté
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
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
                            fontWeight: FontWeight.bold,
                          ),
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
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
