import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({
    super.key,
    required this.imagePath,
    required this.name,
    required this.isSelected, required this.onTap,
  });

  final String imagePath;
  final String name;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: isSelected ? Colors.green : Colors.grey.shade400,
              borderRadius: BorderRadius.circular(50),
            ),
            child: CircleAvatar(
              foregroundImage: AssetImage(imagePath),
              radius: 23,
              // backgroundColor: isSelected ? Colors.green : Colors.grey.shade400,
            ),
          ),
          const SizedBox(height: 6),
          Expanded(
            child: SizedBox(
              width: 80,
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: isSelected ? Colors.black : Colors.black87,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
          if (isSelected) // Barre verte sous l'utilisateur sélectionné
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 91,
              height: 2,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          if (!isSelected) // Barre verte sous l'utilisateur sélectionné
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 91,
              height: 2,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
        ],
      ),
    );
  }
}

class QuickAmountButton extends StatelessWidget {
  final String value;
  final VoidCallback onPressed;

  const QuickAmountButton(
      {super.key, required this.value, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green[50],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      ),
      child: Text(
        "\$$value",
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class NumButton extends StatelessWidget {
  final String number;
  final VoidCallback onTap;

  const NumButton({super.key, required this.number, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 60,
        height: 60,
        child: Center(
          child: Text(
            number,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class NumPad extends StatelessWidget {
  final Function(String) onNumberTap;
  final VoidCallback onDelete;

  const NumPad({super.key, required this.onNumberTap, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NumButton(number: "1", onTap: () => onNumberTap("1")),
              NumButton(number: "2", onTap: () => onNumberTap("2")),
              NumButton(number: "3", onTap: () => onNumberTap("3")),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NumButton(number: "4", onTap: () => onNumberTap("4")),
              NumButton(number: "5", onTap: () => onNumberTap("5")),
              NumButton(number: "6", onTap: () => onNumberTap("6")),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NumButton(number: "7", onTap: () => onNumberTap("7")),
              NumButton(number: "8", onTap: () => onNumberTap("8")),
              NumButton(number: "9", onTap: () => onNumberTap("9")),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NumButton(number: ".", onTap: () => onNumberTap(".")),
              NumButton(number: "0", onTap: () => onNumberTap("0")),
              SizedBox(
                width: 60,
                height: 60,
                child: IconButton(
                  icon: const Icon(Icons.backspace_outlined),
                  onPressed: onDelete,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
