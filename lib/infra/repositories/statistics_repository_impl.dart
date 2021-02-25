import 'package:Queszz/domain/helpers/failures.dart';
import 'package:Queszz/infra/datasources/statistics_local_datasource.dart';

import 'package:Queszz/data/repositories/statistics_repository.dart';
import 'package:Queszz/domain/usecases/update_statistics.dart';
import 'package:dartz/dartz.dart';

class StatisticsRepositoryImpl implements StatisticsRepository {
  final StatisticsLocalDatasource _statisticsLocalDatasource;

  StatisticsRepositoryImpl(
    this._statisticsLocalDatasource,
  );

  @override
  Future<void> updateStatistics(UpdateStatisticsParams params) async {
    try {
      final result = await _statisticsLocalDatasource.updateStatistic(params);

      return Right(result);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
