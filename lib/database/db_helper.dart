import 'dart:core';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBhelper {
  static Database? db;
  static const String _dbName = "myapp.db";

  static const verson = 1;

  static Future get database async {
    if (db != null) {
      return db;
    } else {
      return db = await initDB();
    }
  }

  static Future initDB() async {
    final path = join(await getDatabasesPath(), _dbName);

    return openDatabase(path, version: verson, onCreate: _onCreate);
  }

  static Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS users (
      
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      email TEXT NOT NULL
      )
''');

    await db.execute('''
     
     CREATE TABLE IF NOT EXISTS products (
        
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER NOT NULL,
        name TEXT NOT NULL,
        price DOUBLE NOT NULL ,
        FOREIGN KEY(user_id) REFERENCES users(id)
     
     
     )




''');
  }
}
