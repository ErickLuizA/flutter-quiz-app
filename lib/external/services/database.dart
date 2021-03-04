import 'package:Queszz/domain/constants/categories.dart';
import 'package:Queszz/domain/constants/general_knowledge_questions.dart';
import 'package:Queszz/domain/constants/levels.dart';
import 'package:Queszz/domain/constants/programming_questions.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database _database;

  Database get database => _database;

  Future<void> initDb() async {
    final database = openDatabase(
      join(await getDatabasesPath(), 'queszz_database.db'),
      onCreate: (db, version) async {
        await _createTables(db);

        await _insertSeeds(db);
      },
      version: 1,
    );

    _database = await database;
  }

  Future<void> _createTables(Database db) async {
    await db.execute("""
          CREATE TABLE Categories(
            category_id INTEGER PRIMARY KEY,
            category_name TEXT,
            category_name_pt TEXT,
            category_image TEXT
          )
          """);

    await db.execute("""
          CREATE TABLE Levels(
            level_id INTEGER,
            level_category_id INTEGER,
            stars INTEGER,
            already_tried INTEGER,

            FOREIGN KEY(level_category_id) REFERENCES Categories(category_id)
          )
          """);

    await db.execute("""
          CREATE TABLE Questions(
            question_id INTEGER PRIMARY KEY,
            question_category_id INTEGER,
            question_level_id INTEGER,
            question TEXT,
            question_pt TEXT,
            answers TEXT,
            answers_pt TEXT,
            correct INTEGER,

            FOREIGN KEY(question_category_id) REFERENCES Categories(category_id)
          )
          """);

    await db.execute("""
          CREATE TABLE Statistics(
            total_answers INTEGER,
            correct_answers INTEGER,
            wrong_answers INTEGER,
            skiped_answers INTEGER,
            games_played INTEGER,
            games_won INTEGER,
            games_lost INTEGER,
            queszz_points INTEGER
          )
          """);
  }

  Future<void> insertQuestions(
    Database db,
    Map<String, Object> question,
    Map<String, Object> categorie,
    int level,
  ) async {
    await db.insert('Questions', {
      "question_level_id": level,
      "question_category_id": categorie['category_id'],
      "question": question['question'],
      "answers": question['answers'],
      "question_pt": question['question_pt'],
      "answers_pt": question['answers_pt'],
      "correct": question['correct'],
    });
  }

  Future<void> _insertSeeds(Database db) async {
    CATEGORIES.forEach((i) async {
      await db.insert('Categories', {
        "category_id": i['category_id'],
        "category_name": i['category_name'],
        "category_name_pt": i['category_name_pt'],
        "category_image": i['category_image'],
      });
    });

    CATEGORIES.forEach((categorie) async {
      LEVELS.forEach((i) async {
        await db.insert('Levels', {
          "level_id": i,
          "level_category_id": categorie['category_id'],
          "stars": 0,
          "already_tried": 0,
        });
      });
    });

    CATEGORIES.forEach((categorie) async {
      LEVELS.forEach((level) async {
        switch (categorie['category_id']) {
          case 1:
            GENERALKNOWLEDGEQUESTIONS[level - 1].forEach((question) async {
              await insertQuestions(db, question, categorie, level);
            });
            break;
          case 2:
            PROGRAMMINGQUESTIONS[level - 1].forEach((question) async {
              await insertQuestions(db, question, categorie, level);
            });
            break;
        }
      });
    });

    await db.insert('Statistics', {
      "total_answers": 0,
      "correct_answers": 0,
      "wrong_answers": 0,
      "skiped_answers": 0,
      "games_played": 0,
      "games_won": 0,
      "games_lost": 0,
      "queszz_points": 0,
    });
  }
}
