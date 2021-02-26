import 'package:Queszz/domain/entities/statistics.dart';
import 'package:Queszz/domain/helpers/exceptions.dart';
import 'package:Queszz/domain/usecases/update_statistics.dart';
import 'package:Queszz/infra/datasources/statistics_local_datasource.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class StatisticsLocalDatasourceImpl implements StatisticsLocalDatasource {
  final Database database;

  StatisticsLocalDatasourceImpl({
    @required this.database,
  });

  @override
  Future<void> updateStatistic(UpdateStatisticsParams params) async {
    try {
      final result = await database.rawUpdate(
        """
          UPDATE Statistics
          SET total_answers = total_answers + ?,
            correct_answers = correct_answers + ?,
            wrong_answers = wrong_answers + ?,
            skiped_answers = skiped_answers + ?,
            games_played = games_played + ?,
            games_won = games_won + ?,
            games_lost = games_lost + ?
        """,
        [
          params.statistics.totalAnswers,
          params.statistics.correctAnswers,
          params.statistics.wrongAnswers,
          params.statistics.skipedAnswers,
          params.statistics.gamesPlayed,
          params.statistics.gamesWon,
          params.statistics.gamesLost,
        ],
      );

      return result;
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<Statistics> getStatistics() async {
    try {
      final result = await database.query('Statistics');

      return Statistics.fromMap(result.first);
    } catch (e) {
      throw CacheException();
    }
  }
}
