import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/foundation.dart';

import '../config/db.dart';

abstract class CrudModel {
  String get tableName {
    return '${runtimeType.toString().toLowerCase()}s';
  } 
  final int id;

  CrudModel({ this.id });

  @required dynamic toMap();

  static Future<List<Map<String, dynamic>>> index(String table) async {
    final db = await DB().connect();
    final maps = await db.query(table);
    return maps;
  }

  Future<void> create() async {
    final db = await DB().connect();
    await db.insert(
      tableName,
      this.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> update() async {
    final db = await DB().connect();
    await db.update(
      tableName,
      this.toMap(),
      where: 'id = ?',
      whereArgs: [id],
    );
  }
  
  Future<void> destroy() async {
    final db = await DB().connect();
    await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id]
    );
  }
}