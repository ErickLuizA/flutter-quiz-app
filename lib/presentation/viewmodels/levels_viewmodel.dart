import 'package:Queszz/domain/entities/level.dart';
import 'package:flutter/material.dart';

import 'package:Queszz/domain/usecases/load_levels.dart';

enum UIState { Loading, Error, Success }

class LevelsViewModel extends ChangeNotifier {
  final LoadLevels _loadLevels;

  LevelsViewModel(this._loadLevels);

  List<Level> levelList = List<Level>();
  UIState uiState = UIState.Loading;

  Future<void> loadLevels(LoadLevelsParams params) async {
    final result = await _loadLevels.load(params);

    result.fold(
      (failure) {
        uiState = UIState.Error;
      },
      (success) {
        uiState = UIState.Success;
        levelList = success;
      },
    );

    notifyListeners();
  }
}
