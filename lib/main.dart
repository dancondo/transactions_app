import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './widgets/gains_carousel.dart';
import './config/db.dart';

void main() async {
  await DB().remove();
  initializeDateFormatting('pt_BR', null).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = 'pt_BR';
    return MaterialApp(
      title: 'Minhas Ações App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      locale: Locale('pt_BR'),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/new_transaction': (context) => NewTransactionPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Ativos'),
      ),
      body: Column(
        children: [
          GainsCarousel(),
          TransactionList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/new_transaction');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
