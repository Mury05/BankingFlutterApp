import 'package:flutter/material.dart';

// Ajoute un constructeur à TranslationPage pour passer des paramètres
class TranslationPage extends StatefulWidget {
  final String name;
  final String date;
  final String amount;
  final String type;
  final IconData icon;

  // Constructeur pour recevoir les paramètres
  const TranslationPage({
    super.key,
    required this.name,
    required this.date,
    required this.amount,
    required this.icon, required this.type,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TranslationPageState createState() => _TranslationPageState();
}

class _TranslationPageState extends State<TranslationPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Utilise l'icône passée en paramètre
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(50)),
                      child: Icon(
                        widget.icon, // L'icône est passée via widget
                        size: 24,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Utilise le nom passé en paramètre
                        Text(
                          widget.name, // Le nom est passé via widget
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black87,
                          ),
                        ),
                        // Utilise la date passée en paramètre
                        Text(
                          widget.date, // La date est passée via widget
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // Utilise le montant passé en paramètre
                Text(
                  widget.amount, // Le montant est passé via widget
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: widget.type == 'credit' ? Colors.green[700] : Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
