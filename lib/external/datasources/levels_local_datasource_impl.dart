import 'package:Queszz/domain/entities/level.dart';
import 'package:Queszz/domain/helpers/exceptions.dart';
import 'package:Queszz/domain/usecases/load_levels.dart';
import 'package:Queszz/domain/usecases/update_level.dart';
import 'package:Queszz/infra/datasources/levels_local_datasource.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class LevelsLocalDatasourceImpl implements LevelsLocalDatasource {
  final Database database;

  LevelsLocalDatasourceImpl({
    @required this.database,
  });

  @override
  Future<List<Level>> getLevels(LoadLevelsParams params) async {
    try {
      final result = await database.query(
        'Levels',
        where: 'level_category_id = ?',
        whereArgs: [params.id],
      );

      return List.generate(result.length, (i) {
        return Level.fromMap(result[i]);
      });
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> updateLevel(UpdateLevelParams params) async {
    try {
      final result = await database.rawUpdate(
        """
        UPDATE Levels
        SET stars = CASE WHEN stars > ? THEN stars ELSE ? END,
            already_tried = ?
        WHERE
            level_id = ? AND level_category_id = ?;
      """,
        [
          params.stars,
          params.stars,
          params.alreadyTried,
          params.levelId,
          params.categoryId,
        ],
      );

      return result;
    } catch (e) {
      throw CacheException();
    }
  }
}
