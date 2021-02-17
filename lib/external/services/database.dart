import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database _database;

  Database get database {
    return _database;
  }

  Future<void> initDb() async {
    final database = openDatabase(
      join(await getDatabasesPath(), 'queszz_database.db'),
      onCreate: (db, version) async {},
      version: 1,
    );

    _database = await database;
  }
}
