import 'package:Queszz/domain/usecases/update_statistics.dart';

abstract class StatisticsLocalDatasource {
  Future<void> updateStatistic(UpdateStatisticsParams params);
}
