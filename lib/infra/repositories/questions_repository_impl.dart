import 'package:dartz/dartz.dart';

import 'package:Queszz/data/repositories/questions_repository.dart';
import 'package:Queszz/domain/entities/question.dart';
import 'package:Queszz/domain/helpers/failures.dart';
import 'package:Queszz/domain/usecases/load_questions.dart';
import 'package:Queszz/infra/datasources/questions_local_datasource.dart';
import 'package:flutter/material.dart';

class QuestionsRepositoryImpl implements QuestionsRepository {
  final QuestionsLocalDatasource questionsLocalDatasource;

  QuestionsRepositoryImpl({
    @required this.questionsLocalDatasource,
  });

  @override
  Future<Either<Failure, List<Question>>> getQuestions(
      LoadQuestionsParams params) async {
    try {
      final result = await questionsLocalDatasource.getQuestions(params);

      return Right(result);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
