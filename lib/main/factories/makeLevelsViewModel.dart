import 'package:Queszz/data/repositories/levels_repository.dart';
import 'package:Queszz/data/usecases/load_levels_impl.dart';
import 'package:Queszz/domain/usecases/load_levels.dart';
import 'package:Queszz/external/datasources/levels_local_datasource_impl.dart';
import 'package:Queszz/external/services/database.dart';
import 'package:Queszz/infra/datasources/levels_local_datasource.dart';
import 'package:Queszz/infra/repositories/levels_repository_impl.dart';
import 'package:Queszz/presentation/viewmodels/levels_viewmodel.dart';
import 'package:sqflite/sqlite_api.dart';

LevelsViewModel makeLevelsViewModel() {
  Database database = DatabaseHelper().database;

  LevelsLocalDatasource levelsLocalDatasource = LevelsLocalDatasourceImpl(
    database: database,
  );

  LevelsRepository levelsRepository = LevelsRepositoryImpl(
    levelsLocalDatasource: levelsLocalDatasource,
  );

  LoadLevels loadLevels = LoadLevelsImpl(
    levelsRepository: levelsRepository,
  );

  LevelsViewModel levelsViewModel = LevelsViewModel(loadLevels);

  return levelsViewModel;
}
