import 'package:Queszz/domain/entities/statistics.dart';
import 'package:Queszz/domain/helpers/failures.dart';
import 'package:Queszz/domain/usecases/update_statistics.dart';
import 'package:dartz/dartz.dart';

abstract class StatisticsRepository {
  Future<Either<Failure, void>> updateStatistics(UpdateStatisticsParams params);

  Future<Either<Failure, Statistics>> getStatistics();
}
