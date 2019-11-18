import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/transaction.dart';
import './transaction_list_item.dart';

class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  Future<List<Transaction>> _transactions() async {
    return Transaction.index();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Transaction>>(
        future: _transactions(),
        builder: (BuildContext context, AsyncSnapshot<List<Transaction>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Expanded(
                child: Card(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            case ConnectionState.done:
              if (snapshot.data.length > 0) {
                return Column(
                  children: snapshot.data.map((transaction) {
                    return TransactionListItem(transaction);
                  }).toList(),
                );
              } else {
                return Expanded(
                  child: Card(
                    elevation: 10,
                    child: Center(
                      child: Text('Nenhum Ativo'),
                    ),
                  ),
                );
              }
          }
          return null;
        },
      ),
    );
  }
}
