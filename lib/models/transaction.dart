import './crud_model.dart';
import 'package:flutter/foundation.dart';

class Transaction extends CrudModel {
  final int id;
  final String name;
  final int price;
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
      'price': price,
      'amount': amount,
      'date': date.toString()
    };
  }

  Transaction toEntity(map) {
    return Transaction(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      amount: map['amount'],
      date: map['date']
    );
  }

  static index() {
    return CrudModel.index(Transaction, 'transactions');
  }

}