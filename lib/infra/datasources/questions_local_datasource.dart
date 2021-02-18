import 'package:Queszz/domain/entities/question.dart';
import 'package:Queszz/domain/usecases/load_questions.dart';

abstract class QuestionsLocalDatasource {
  Future<List<Question>> getQuestions(LoadQuestionsParams params);
}
