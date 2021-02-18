import 'package:Queszz/domain/entities/level.dart';
import 'package:Queszz/domain/usecases/load_levels.dart';

abstract class LevelsLocalDatasource {
  Future<List<Level>> getLevels(LoadLevelsParams params);
}
