import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  final String cardType;
  final String firstAmount;
  final String secondAmount;

  const CardPage({
    super.key,
    required this.cardType,
    required this.firstAmount,
    required this.secondAmount,
  });

  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller; // Contrôleur d'animation
  double _animatedSecondAmount = 0.0; // Valeur animée pour secondAmount

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000), // Durée de l'animation
    )..addListener(() {
        setState(() {
          _animatedSecondAmount = double.parse(widget.secondAmount.replaceAll('\$', '').replaceAll(',', '')) * _controller.value;
        });
      });
    _controller.forward(); // Démarre l'animation
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose le contrôleur d'animation
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.cardType,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[900],
                  ),
                ),
                SizedBox(height: 5),
                // Affichage de firstAmount avec animation
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Text(
                      widget.firstAmount, // Formatage du montant
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[600],
                      ),
                    );
                  },
                ),
              ],
            ),
            // Affichage de secondAmount avec animation
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Text(
                  "\$${_animatedSecondAmount.toStringAsFixed(2)}", // Formatage du montant
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
