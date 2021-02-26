import 'package:Queszz/data/repositories/levels_repository.dart';
import 'package:Queszz/data/repositories/statistics_repository.dart';
import 'package:Queszz/data/usecases/update_level_impl.dart';
import 'package:Queszz/data/usecases/update_statistics_impl.dart';
import 'package:Queszz/domain/usecases/update_level.dart';
import 'package:Queszz/domain/usecases/update_statistics.dart';
import 'package:Queszz/external/datasources/levels_local_datasource_impl.dart';
import 'package:Queszz/external/datasources/statistics_local_datasource_impl.dart';
import 'package:Queszz/external/services/database.dart';
import 'package:Queszz/infra/datasources/levels_local_datasource.dart';
import 'package:Queszz/infra/datasources/statistics_local_datasource.dart';
import 'package:Queszz/infra/repositories/levels_repository_impl.dart';
import 'package:Queszz/infra/repositories/statistics_repository_impl.dart';
import 'package:Queszz/presentation/viewmodels/score_viewmodel.dart';
import 'package:sqflite/sqflite.dart';

ScoreViewModel makeScoreViewModel() {
  Database database = DatabaseHelper().database;

  LevelsLocalDatasource levelsLocalDatasource = LevelsLocalDatasourceImpl(
    database: database,
  );

  StatisticsLocalDatasource statisticsLocalDatasource =
      StatisticsLocalDatasourceImpl(
    database: database,
  );

  LevelsRepository levelsRepository = LevelsRepositoryImpl(
    levelsLocalDatasource: levelsLocalDatasource,
  );

  StatisticsRepository statisticsRepository = StatisticsRepositoryImpl(
    statisticsLocalDatasource,
  );

  UpdateLevel updateLevel = UpdateLevelImpl(levelsRepository);

  UpdateStatistics updateStatistics = UpdateStatisticsImpl(
    statisticsRepository,
  );

  ScoreViewModel scoreViewModel = ScoreViewModel(
    updateLevelUseCase: updateLevel,
    updateStatisticsUseCase: updateStatistics,
  );

  return scoreViewModel;
}
