import 'package:Queszz/domain/usecases/update_level.dart';
import 'package:Queszz/domain/usecases/update_statistics.dart';
import 'package:flutter/material.dart';

class ScoreViewModel extends ChangeNotifier {
  final UpdateLevel updateLevelUseCase;
  final UpdateStatistics updateStatisticsUseCase;

  ScoreViewModel({
    @required this.updateLevelUseCase,
    @required this.updateStatisticsUseCase,
  });

  Future<void> updateLevel(UpdateLevelParams params) async {
    await updateLevelUseCase.update(params);
  }

  Future<void> updateStatistics(UpdateStatisticsParams params) async {
    await updateStatisticsUseCase.update(params);
  }
}
