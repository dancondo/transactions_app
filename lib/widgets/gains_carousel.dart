import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import '../models/transaction.dart';

class GainsCarousel extends StatelessWidget {
  Future<String> _gains() async {
    final value = await Transaction.totalValue();
    return MoneyMaskedTextController(initialValue: value, leftSymbol: 'R\$ ')
        .text;
  }

  @override
  build(BuildContext context) {
    return Card(
      child: FutureBuilder(
        future: _gains(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Container(
                width: double.infinity,
                padding: EdgeInsets.all(50),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case ConnectionState.done:
              return Container(
                width: double.infinity,
                padding: EdgeInsets.all(50),
                child: Column(
                  children: [
                    Text('Patrimonio'),
                    Text(
                      snapshot.data,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
          }
          return null;
        },
      ),
    );
  }
}
