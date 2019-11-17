import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String name;
  final double value;
  final int quantity; 
  final DateTime date;

  Transaction({
    @required this.id,
    @required this.name,
    @required this.value,
    @required this.quantity,
    @required this.date,
  });
}
