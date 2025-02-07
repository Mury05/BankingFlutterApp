class Transaction {
  final int id;
  final double amount;
  final DateTime date;
  final String type; // "debit" ou "credit"
  final String cardType; // "Primary", "Secondary", etc.
  final String? receiver;

  Transaction({
    required this.amount,
    required this.date,
    required this.type,
    this.receiver,
    required this.cardType,
  }) : id = DateTime.now()
            .millisecondsSinceEpoch; // Génère un ID unique basé sur le timestamp

  @override
  String toString() {
    return 'Transaction(id: $id, amount: $amount, date: $date, type: $type, cardType: $cardType, receiver: $receiver)';
  }
}
