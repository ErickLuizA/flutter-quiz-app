import 'package:dartz/dartz.dart';

import 'package:Queszz/domain/helpers/failures.dart';
import 'package:flutter/material.dart';

class UpdateLevelParams {
  final int levelId;
  final int categoryId;
  final int stars;
  final int alreadyTried;

  UpdateLevelParams({
    @required this.levelId,
    @required this.categoryId,
    @required this.stars,
    @required this.alreadyTried,
  });
}

abstract class UpdateLevel {
  Future<Either<Failure, void>> update(UpdateLevelParams params);
}
