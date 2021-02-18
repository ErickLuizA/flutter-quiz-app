import 'package:dartz/dartz.dart';

import 'package:Queszz/domain/entities/question.dart';
import 'package:Queszz/domain/helpers/failures.dart';
import 'package:flutter/material.dart';

class LoadQuestionsParams {
  final int levelId;
  final int categoryId;
  LoadQuestionsParams({
    @required this.levelId,
    @required this.categoryId,
  });
}

abstract class LoadQuestions {
  Future<Either<Failure, List<Question>>> load(LoadQuestionsParams params);
}
