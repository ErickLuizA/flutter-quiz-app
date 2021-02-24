import 'package:Queszz/domain/usecases/update_level.dart';
import 'package:flutter/material.dart';

class ScoreViewModel extends ChangeNotifier {
  final UpdateLevel _updateLevel;

  ScoreViewModel(this._updateLevel);

  Future<void> updateLevel(UpdateLevelParams params) async {
    await _updateLevel.update(params);
  }
}
