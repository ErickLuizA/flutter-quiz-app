import 'package:dartz/dartz.dart';

import 'package:Queszz/domain/entities/level.dart';
import 'package:Queszz/domain/helpers/failures.dart';

class LoadLevelsParams {
  final int id;

  LoadLevelsParams(this.id);
}

abstract class LoadLevels {
  Future<Either<Failure, List<Level>>> load(LoadLevelsParams params);
}
