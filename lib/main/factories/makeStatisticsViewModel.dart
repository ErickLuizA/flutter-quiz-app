import 'package:Queszz/data/repositories/statistics_repository.dart';
import 'package:Queszz/data/usecases/load_statistics_impl.dart';
import 'package:Queszz/domain/usecases/load_statistics.dart';
import 'package:Queszz/external/datasources/statistics_local_datasource_impl.dart';
import 'package:Queszz/external/services/database.dart';
import 'package:Queszz/infra/datasources/statistics_local_datasource.dart';
import 'package:Queszz/infra/repositories/statistics_repository_impl.dart';
import 'package:Queszz/presentation/viewmodels/statistics_viewmodel.dart';
import 'package:sqflite/sqflite.dart';

StatisticsViewModel makeStatisticsViewModel() {
  Database database = DatabaseHelper().database;

  StatisticsLocalDatasource statisticsLocalDatasource =
      StatisticsLocalDatasourceImpl(
    database: database,
  );

  StatisticsRepository statisticsRepository = StatisticsRepositoryImpl(
    statisticsLocalDatasource,
  );

  LoadStatistics loadStatistics = LoadStatisticsImpl(
    statisticsRepository,
  );

  StatisticsViewModel statisticsViewModel = StatisticsViewModel(
    loadStatistics,
  );

  return statisticsViewModel;
}
