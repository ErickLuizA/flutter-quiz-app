import 'package:Queszz/data/repositories/levels_repository.dart';
import 'package:Queszz/data/usecases/update_level_impl.dart';
import 'package:Queszz/domain/usecases/update_level.dart';
import 'package:Queszz/external/datasources/levels_local_datasource_impl.dart';
import 'package:Queszz/external/services/database.dart';
import 'package:Queszz/infra/datasources/levels_local_datasource.dart';
import 'package:Queszz/infra/repositories/levels_repository_impl.dart';
import 'package:Queszz/presentation/viewmodels/score_viewmodel.dart';
import 'package:sqflite/sqflite.dart';

ScoreViewModel makeScoreViewModel() {
  Database database = DatabaseHelper().database;

  LevelsLocalDatasource levelsLocalDatasource =
      LevelsLocalDatasourceImpl(database: database);

  LevelsRepository levelsRepository =
      LevelsRepositoryImpl(levelsLocalDatasource: levelsLocalDatasource);

  UpdateLevel updateLevel = UpdateLevelImpl(levelsRepository);

  ScoreViewModel scoreViewModel = ScoreViewModel(updateLevel);

  return scoreViewModel;
}
