import 'package:Queszz/domain/usecases/load_levels.dart';
import 'package:dartz/dartz.dart';

import 'package:Queszz/data/repositories/levels_repository.dart';
import 'package:Queszz/domain/entities/level.dart';
import 'package:Queszz/domain/helpers/failures.dart';
import 'package:Queszz/infra/datasources/levels_local_datasource.dart';
import 'package:flutter/material.dart';

class LevelsRepositoryImpl implements LevelsRepository {
  final LevelsLocalDatasource levelsLocalDatasource;
  LevelsRepositoryImpl({
    @required this.levelsLocalDatasource,
  });

  @override
  Future<Either<Failure, List<Level>>> getLevels(
      LoadLevelsParams params) async {
    try {
      final result = await levelsLocalDatasource.getLevels(params);

      return Right(result);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
