import 'package:Queszz/data/repositories/questions_repository.dart';
import 'package:Queszz/data/usecases/load_questions_impl.dart';
import 'package:Queszz/domain/usecases/load_questions.dart';
import 'package:Queszz/external/datasources/questions_local_datasource_impl.dart';
import 'package:Queszz/external/services/database.dart';
import 'package:Queszz/infra/datasources/questions_local_datasource.dart';
import 'package:Queszz/infra/repositories/questions_repository_impl.dart';
import 'package:Queszz/presentation/viewmodels/questions_viewmodel.dart';
import 'package:sqflite/sqlite_api.dart';

QuestionsViewModel makeQuestionsViewModel() {
  Database database = DatabaseHelper().database;

  QuestionsLocalDatasource questionsLocalDatasource =
      QuestionsLocalDatasourceImpl(
    database: database,
  );

  QuestionsRepository questionsRepository = QuestionsRepositoryImpl(
    questionsLocalDatasource: questionsLocalDatasource,
  );

  LoadQuestions loadQuestions = LoadQuestionsImpl(
    questionsRepository: questionsRepository,
  );

  QuestionsViewModel questionsViewModel = QuestionsViewModel(loadQuestions);

  return questionsViewModel;
}
