import 'package:Queszz/domain/entities/statistics.dart';
import 'package:Queszz/domain/helpers/failures.dart';
import 'package:dartz/dartz.dart';

class UpdateStatisticsParams {
  final Statistics statistics;

  UpdateStatisticsParams(this.statistics);
}

abstract class UpdateStatistics {
  Future<Either<Failure, void>> update(UpdateStatisticsParams params);
}
