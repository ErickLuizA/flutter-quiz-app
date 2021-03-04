import 'package:Queszz/domain/entities/question.dart';
import 'package:Queszz/domain/helpers/exceptions.dart';
import 'package:Queszz/domain/usecases/load_questions.dart';
import 'package:Queszz/infra/datasources/questions_local_datasource.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class QuestionsLocalDatasourceImpl implements QuestionsLocalDatasource {
  final Database database;

  QuestionsLocalDatasourceImpl({
    @required this.database,
  });

  @override
  Future<List<Question>> getQuestions(LoadQuestionsParams params) async {
    try {
      final result = await database.rawQuery("""
        SELECT * FROM Questions
        WHERE Questions.question_level_id = ? AND Questions.question_category_id = ?
      """, [params.levelId, params.categoryId]);

      return List.generate(result.length, (i) {
        return Question.fromMap(result[i], params.locale);
      });
    } catch (e) {
      throw CacheException();
    }
  }
}
