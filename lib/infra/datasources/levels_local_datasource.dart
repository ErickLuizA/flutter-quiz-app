import 'package:Queszz/domain/entities/level.dart';
import 'package:Queszz/domain/usecases/load_levels.dart';
import 'package:Queszz/domain/usecases/update_level.dart';

abstract class LevelsLocalDatasource {
  Future<List<Level>> getLevels(LoadLevelsParams params);

  Future<void> updateLevel(UpdateLevelParams params);
}
