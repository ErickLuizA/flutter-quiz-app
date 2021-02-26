import 'package:Queszz/domain/entities/statistics.dart';
import 'package:flutter/material.dart';

import 'package:Queszz/domain/usecases/load_statistics.dart';

enum UIState { Loading, Error, Success }

class StatisticsViewModel extends ChangeNotifier {
  final LoadStatistics _loadStatistics;

  StatisticsViewModel(this._loadStatistics);

  UIState uiState = UIState.Loading;

  Statistics statistics;

  Future<void> loadStatistics() async {
    final result = await _loadStatistics.load();

    result.fold(
      (failure) {
        uiState = UIState.Error;
      },
      (success) {
        uiState = UIState.Success;
        statistics = success;
      },
    );

    notifyListeners();
  }
}
