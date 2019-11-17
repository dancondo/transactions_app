import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../models/transaction.dart';

class NewTransactionPage extends StatelessWidget {
  final nameController = TextEditingController();
  final dateController = TextEditingController();
  final amountController = TextEditingController();
  final priceController = TextEditingController();

  _save()async  {
    final transaction = Transaction(
      name: nameController.text,
      amount: 100,
      price: 1600,
      date: DateTime.now(),
    );
    await transaction.create();
    print(transaction);
  }

  _clear() {
    return null;
  }

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
              controller: nameController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Data de Compra',
              ),
              controller: dateController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Quantidade',
              ),
              controller: amountController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Preço Unitário',
              ),
              controller: priceController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RaisedButton(
                  child: Text('Limpar'),
                  onPressed: _clear,
                ),
                RaisedButton(
                  child: Text('Enviar'),
                  onPressed: _save,
                  color: Colors.orange,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
