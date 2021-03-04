import 'package:Queszz/data/repositories/statistics_repository.dart';
import 'package:Queszz/domain/helpers/failures.dart';
import 'package:Queszz/domain/usecases/update_statistics.dart';
import 'package:dartz/dartz.dart';

class UpdateStatisticsImpl implements UpdateStatistics {
  final StatisticsRepository _statisticsRepository;

  UpdateStatisticsImpl(this._statisticsRepository);

  @override
  Future<Either<Failure, void>> update(UpdateStatisticsParams params) async {
    return await _statisticsRepository.updateStatistics(params);
  }
}
