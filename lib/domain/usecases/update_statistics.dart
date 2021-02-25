import 'package:Queszz/domain/entities/statistics.dart';

class UpdateStatisticsParams {
  final Statistics statistics;

  UpdateStatisticsParams(this.statistics);
}

abstract class UpdateStatistics {
  Future<void> update(UpdateStatisticsParams params);
}
