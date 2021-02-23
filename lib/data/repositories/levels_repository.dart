import 'package:Queszz/domain/entities/level.dart';
import 'package:Queszz/domain/helpers/failures.dart';
import 'package:Queszz/domain/usecases/load_levels.dart';
import 'package:Queszz/domain/usecases/update_level.dart';
import 'package:dartz/dartz.dart';

abstract class LevelsRepository {
  Future<Either<Failure, List<Level>>> getLevels(LoadLevelsParams params);

  Future<Either<Failure, void>> updateLevel(UpdateLevelParams params);
}
