import 'package:Queszz/domain/constants/levels.dart';
import 'package:Queszz/domain/constants/questions.dart';
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
      onCreate: (db, version) async {
        await createTables(db);

        await insertSeeds(db);
      },
      version: 1,
    );

    _database = await database;
  }

  Future<void> createTables(Database db) async {
    await db.execute("""
          CREATE TABLE Categories(
            category_id INTEGER PRIMARY KEY,
            category_name TEXT,
            category_image TEXT
          )
          """);

    await db.execute("""
          CREATE TABLE Levels(
            level_id INTEGER PRIMARY KEY,
            level_category_id INTEGER,
            stars INTEGER,
            already_tried INTEGER,

            FOREIGN KEY(level_category_id) REFERENCES Categories(category_id)
          )
          """);

    await db.execute("""
          CREATE TABLE Questions(
            question_id INTEGER PRIMARY KEY,
            question_level_id INTEGER,
            question TEXT,
            answers TEXT,
            correct INTEGER,

            FOREIGN KEY(question_level_id) REFERENCES Levels(level_id)
          )
          """);
  }

  Future<void> insertSeeds(Database db) async {
    await db.insert('Categories', {
      "category_id": 1,
      "category_name": "General Knowledge",
      "category_image": "GeneralKnowledge"
    });

    LEVELS.forEach((i) async {
      await db.insert('Levels', {
        "level_id": i,
        "level_category_id": 1,
        "stars": 0,
        "already_tried ": 0,
      });
    });

    QUESTIONS.forEach((i) async {
      await db.insert('Questions', {
        "question_level_id": i['question_level_id'],
        "question": i['question'],
        "answers": i['answers'],
        "correct": i['correct'],
      });
    });
  }
}
