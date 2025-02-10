import 'package:flutter/material.dart';

class CardSelectionModal extends StatefulWidget {
  @override
  _CardSelectionModalState createState() => _CardSelectionModalState();
}

class _CardSelectionModalState extends State<CardSelectionModal> {
  String? selectedCardType;

  void _openCardSelectionModal() async {
    final List<String> cardTypes = [
      "Primary Card",
      "Secondary Debit Card",
      "Credit Card",
      "Business Card"
    ];

    String? selected = await showModalBottomSheet<String>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Select Card Type",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              ...cardTypes.map((type) => ListTile(
                    title: Text(type),
                    onTap: () => Navigator.pop(context, type),
                  )),
            ],
          ),
        );
      },
    );

    if (selected != null) {
      setState(() {
        selectedCardType = selected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Card Type")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              selectedCardType ?? "No card selected",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _openCardSelectionModal,
              child: Text("Choose Card Type"),
            ),
          ],
        ),
      ),
    );
  }
}
