import 'package:Queszz/domain/usecases/update_statistics.dart';

abstract class StatisticsRepository {
  Future<void> updateStatistics(
    UpdateStatisticsParams params,
  );
}
