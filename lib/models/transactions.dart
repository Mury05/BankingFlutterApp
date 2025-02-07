class Transaction {
  final int id;
  final double amount;
  final DateTime date;
  final String type; // "debit" ou "credit"
  final String cardType; // "Primary", "Secondary", etc.
  final String receiver;

  Transaction({
    required this.amount,
    required this.date,
    required this.type,
    required this.receiver,
    required this.cardType,
  }) : id = DateTime.now()
            .millisecondsSinceEpoch; // Génère un ID unique basé sur le timestamp

  @override
  String toString() {
    return 'Transaction(id: $id, amount: $amount, date: $date, type: $type, cardType: $cardType, receiver: $receiver)';
  }
}

class Transactions {
  final List<Transaction> _transactions = [];

  bool addTransaction(Transaction transaction) {
    double currentBalance = getBalanceByCardType(transaction.cardType);

    // Vérifier si le solde est suffisant pour un débit
    if (transaction.type == 'debit' && currentBalance < transaction.amount) {
      return false; // Transaction refusée
    }

    _transactions.add(transaction);
    return true; // Transaction réussie
  }

  List<Transaction> get transactions => _transactions;

  // 🔹 Récupère le solde total de toutes les cartes
  double get totalBalance {
    double balance = 0;
    for (var transaction in _transactions) {
      if (transaction.type == 'credit') {
        balance += transaction.amount;
      } else if (transaction.type == 'debit') {
        balance -= transaction.amount;
      }
    }
    return balance;
  }

  // 🔹 Récupère le solde d'une carte spécifique
  double getBalanceByCardType(String cardType) {
    double balance = 0;
    for (var transaction
        in _transactions.where((t) => t.cardType == cardType)) {
      if (transaction.type == 'credit') {
        balance += transaction.amount;
      } else if (transaction.type == 'debit') {
        balance -= transaction.amount;
      }
    }
    return balance;
  }

  // 🔹 Filtrer les transactions par type (débit/crédit)
  List<Transaction> filterTransactionsByType(String type) {
    return _transactions.where((t) => t.type == type).toList();
  }

  // 🔹 Filtrer les transactions par type de carte
  List<Transaction> filterTransactionsByCardType(String cardType) {
    return _transactions.where((t) => t.cardType == cardType).toList();
  }
}
