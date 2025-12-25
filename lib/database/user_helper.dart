import 'package:sqflite/sqflite.dart';
import 'package:testing/database/db_helper.dart';

class UserHelper {
  static const String usersTable = "users";
  static Future insertUsers(String name, String email) async {
    final Database conn = await DBhelper.database;

    return await conn.insert(usersTable, {"name": name, "email": email});
  }

  static Future<List<Map<String, dynamic>>> getUsers() async {
    final Database conn = await DBhelper.database;

    return conn.query(usersTable, columns: ['id', "name", "email"]);
  }

  static Future<int> deleteUser(int id) async {
    final Database conn = await DBhelper.database;
    return conn.delete(usersTable, where: "id=?", whereArgs: [id]);
  }

  static Future<int> updateUser(int id, String name, String email) async {
    final Database conn = await DBhelper.database;

    return conn.update(
      usersTable,
      {"name": name, "email": email},
      where: "id=?",
      whereArgs: [id],
    );
  }
}
