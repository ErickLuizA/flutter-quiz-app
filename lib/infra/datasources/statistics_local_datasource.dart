import 'package:Queszz/domain/entities/statistics.dart';
import 'package:Queszz/domain/usecases/update_statistics.dart';

abstract class StatisticsLocalDatasource {
  Future<void> updateStatistic(UpdateStatisticsParams params);

  Future<Statistics> getStatistics();
}
