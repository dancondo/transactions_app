import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  Future<void> remove() async {
    await deleteDatabase(
      join(await getDatabasesPath(), 'transactions_database.db')
    );
    print("DELETED");
  }

  Future<Database> connect() async {
    return openDatabase(
      join(await getDatabasesPath(), 'transactions_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE transactions(id INTEGER PRIMARY_KEY, name TEXT, price INTEGER, amount INTEGER, date TEXT)"
        );
      },
      version: 3
    );
  }
}
