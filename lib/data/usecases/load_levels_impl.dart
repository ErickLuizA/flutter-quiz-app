import 'package:dartz/dartz.dart';

import 'package:Queszz/data/repositories/levels_repository.dart';
import 'package:Queszz/domain/entities/level.dart';
import 'package:Queszz/domain/helpers/failures.dart';
import 'package:Queszz/domain/usecases/load_levels.dart';
import 'package:flutter/material.dart';

class LoadLevelsImpl implements LoadLevels {
  final LevelsRepository levelsRepository;

  LoadLevelsImpl({
    @required this.levelsRepository,
  });

  @override
  Future<Either<Failure, List<Level>>> load(LoadLevelsParams params) async {
    return await levelsRepository.getLevels(params);
  }
}
