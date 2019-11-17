import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String name;
  final double price;
  final int quantity; 
  final DateTime date;

  Transaction({
    @required this.id,
    @required this.name,
    @required this.price,
    @required this.quantity,
    @required this.date,
  });
}
