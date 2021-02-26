import 'package:dartz/dartz.dart';

import 'package:Queszz/data/repositories/statistics_repository.dart';
import 'package:Queszz/domain/entities/statistics.dart';
import 'package:Queszz/domain/helpers/failures.dart';
import 'package:Queszz/domain/usecases/load_statistics.dart';

class LoadStatisticsImpl implements LoadStatistics {
  final StatisticsRepository _statisticsRepository;

  LoadStatisticsImpl(
    this._statisticsRepository,
  );

  @override
  Future<Either<Failure, Statistics>> load() async {
    return await _statisticsRepository.getStatistics();
  }
}
