import './crud_model.dart';
import 'package:flutter/foundation.dart';

class Transaction extends CrudModel {
  final int id;
  final String name;
  final double price;
  final int amount;
  final DateTime date;

  Transaction({
    this.id,
    @required this.name,
    @required this.price,
    @required this.amount,
    @required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price * 100,
      'amount': amount,
      'date': date.toString()
    };
  }

  static toEntity(map) {
    return Transaction(
      id: map['id'],
      name: map['name'],
      price: map['price'] / 100,
      amount: map['amount'],
      date: DateTime.parse(map['date']),
    );
  }

  static Future<List<Transaction>> index() async {
    final maps = await CrudModel.index('transactions');
    return List.generate(maps.length, (i) {
      return Transaction.toEntity(maps[i]);
    });
  }

  static Future<double> totalValue() async {
    final transactions = await Transaction.index();
    return transactions.map((transaction) {
      return transaction.price * transaction.amount;
    }).reduce((a, b) => a + b);
  }
}
