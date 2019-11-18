import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../models/transaction.dart';

class NewTransactionPage extends StatefulWidget {
  @override
  _NewTransactionPageState createState() => _NewTransactionPageState();
}

class _NewTransactionPageState extends State<NewTransactionPage> {
  final nameController = TextEditingController();

  final dateController = TextEditingController();

  final amountController = TextEditingController();

  final priceController = MoneyMaskedTextController();

  void _save(context) async {
    final transaction = Transaction(
      name: nameController.text.toUpperCase(),
      amount: int.parse(amountController.text),
      price: priceController.numberValue,
      date: DateTime.now(),
    );
    await transaction.create();
    Navigator.pushNamed(context, '/');
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
              keyboardType: TextInputType.text,
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
              keyboardType: TextInputType.number,
              controller: amountController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Preço Unitário',
              ),
              keyboardType: TextInputType.number,
              controller: priceController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RaisedButton(
                  child: Text('Enviar'),
                  onPressed: () => _save(context),
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
