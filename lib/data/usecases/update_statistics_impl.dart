import 'package:Queszz/data/repositories/statistics_repository.dart';
import 'package:Queszz/domain/usecases/update_statistics.dart';

class UpdateStatisticsImpl implements UpdateStatistics {
  final StatisticsRepository _statisticsRepository;

  UpdateStatisticsImpl(this._statisticsRepository);

  @override
  Future<void> update(UpdateStatisticsParams params) async {
    return await _statisticsRepository.updateStatistics(params);
  }
}
