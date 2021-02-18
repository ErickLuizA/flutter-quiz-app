import 'package:Queszz/domain/entities/question.dart';
import 'package:Queszz/domain/helpers/failures.dart';
import 'package:Queszz/domain/usecases/load_questions.dart';
import 'package:dartz/dartz.dart';

abstract class QuestionsRepository {
  Future<Either<Failure, List<Question>>> getQuestions(
      LoadQuestionsParams params);
}
