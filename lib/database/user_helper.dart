import 'package:sqflite/sqflite.dart';
import 'package:testing/database/db_helper.dart';

class UserHelper {
  static const String usersTable = "users";

  static Future<int> login(String email, String password) async {
    Database con = await DBhelper.database;
    final List? result = await con.query(
      usersTable,
      columns: ["id"],
      where: "email=? AND password=?",
      whereArgs: [email, password],
    );

    if (result!.isNotEmpty) {
      return result.first['id'];
    }
    return -1;
  }

  static Future CreateUserSession(int id) async {
    final Database conn = await DBhelper.database;
    conn.delete("session");
    return conn.insert("session", {"user_id": id});
  }

  static Future deleteUserSession() async {
    final Database conn = await DBhelper.database;
    conn.delete('session');
  }

  static Future getUserSession() async {
    final Database conn = await DBhelper.database;

    final List<Map> result = await conn.query(
      "session",
      columns: ["user_id"],
      limit: 1,
    );
    if (result.isNotEmpty) {
      return result.first['user_id'] as int;
    }
    return null;
  }

  static Future insertUsers(String email, String password) async {
    final Database conn = await DBhelper.database;

    final id = await conn.insert(usersTable, {
      "email": email,
      "password": password,
    }, conflictAlgorithm: ConflictAlgorithm.ignore);

    if (id == -1) {
      print("Usere already exists");
    }
    return id;
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
