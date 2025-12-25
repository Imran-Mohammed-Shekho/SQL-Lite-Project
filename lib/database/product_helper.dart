import 'package:sqflite/sqflite.dart';
import 'package:testing/database/db_helper.dart';

class ProductHelper {
  static const String productTable = "products";

  static Future insertProduct(String name, double price, int userId) async {
    final Database conn = await DBhelper.database;

    return await conn.insert(productTable, {
      "name": name,
      "price": price,
      "user_id": userId,
    });
  }

  static Future<List<Map<String, dynamic>>> getProducts() async {
    final Database conn = await DBhelper.database;

    return conn.query(
      productTable,
      columns: ['id', "user_id", "name", "price"],
    );
  }

  static Future<int> deleteProducts(int id) async {
    final Database conn = await DBhelper.database;
    return conn.delete(productTable, where: "id=?", whereArgs: [id]);
  }

  static Future<int> updateProducts(int id, String name, String price) async {
    final Database conn = await DBhelper.database;

    return conn.update(
      productTable,
      {"name": name, "price": price},
      where: "id=?",
      whereArgs: [id],
    );
  }
}
