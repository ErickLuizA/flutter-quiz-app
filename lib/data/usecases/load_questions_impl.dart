import 'package:Queszz/data/repositories/questions_repository.dart';
import 'package:dartz/dartz.dart';

import 'package:Queszz/domain/entities/question.dart';
import 'package:Queszz/domain/helpers/failures.dart';
import 'package:Queszz/domain/usecases/load_questions.dart';
import 'package:flutter/material.dart';

class LoadQuestionsImpl implements LoadQuestions {
  final QuestionsRepository questionsRepository;

  LoadQuestionsImpl({
    @required this.questionsRepository,
  });

  @override
  Future<Either<Failure, List<Question>>> load(
      LoadQuestionsParams params) async {
    return await questionsRepository.getQuestions(params);
  }
}
