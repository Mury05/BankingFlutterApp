import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});
  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text("Primary Card"),
              Text("-7239"),
            ],
          ),
          Text(
            "2,874.85",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
