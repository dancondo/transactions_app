import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewTransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Ativo'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Ativo',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Quantidade',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Preço Unitário',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
