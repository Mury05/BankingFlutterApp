
import 'package:banking_flutter_app/models/transactions.dart';

class Transactions {
  static final Transactions _instance = Transactions._internal();
  final List<Transaction> _transactions = [
  Transaction(
    amount: 2000.00,
    date: DateTime.now(),
    type: 'credit',
    // receiver: "Avery Smithson",
    cardType: 'Secondary Card',
  ),
  Transaction(
    amount: 200.00,
    date: DateTime.now(),
    type: 'debit',
    receiver: "Bright Line",
    cardType: 'Primary Card',
  ),
    Transaction(
    amount: 250.00,
    date: DateTime.now().subtract(const Duration(days: 1)),
    type: 'credit',
    // receiver: "Pratick Smithson",
    cardType: 'Primary Card',
  ),
  ];

  factory Transactions() {
    return _instance;
  }

  Transactions._internal();

  bool addTransaction(Transaction transaction) {
    double currentBalance = getBalanceByCardType(transaction.cardType);

    // Vérifier si le solde est suffisant pour un débit
    if (transaction.type == 'debit' && currentBalance < transaction.amount) {
      return false; // Transaction refusée
    }

    _transactions.insert(0,transaction);
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
