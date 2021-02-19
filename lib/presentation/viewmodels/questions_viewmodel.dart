import 'package:Queszz/domain/entities/question.dart';
import 'package:flutter/material.dart';

import 'package:Queszz/domain/usecases/load_questions.dart';

enum UIState { Loading, Error, Success }

class QuestionsViewModel extends ChangeNotifier {
  final LoadQuestions _loadQuestions;

  QuestionsViewModel(this._loadQuestions);

  PageController pageController = PageController();

  List<Question> questionList = List<Question>();
  int currentQuestion = 1;
  int correctAnswers = 0;

  int isCorrect;

  UIState uiState = UIState.Loading;

  Future<void> loadQuestions(LoadQuestionsParams params) async {
    final result = await _loadQuestions.load(params);

    result.fold(
      (failure) {
        uiState = UIState.Error;
      },
      (success) {
        uiState = UIState.Success;
        questionList = success;
      },
    );

    notifyListeners();
  }

  void checkAnswer(String answer, int index) {
    if (answer == questionList[index].correct) {
      isCorrect = index;
      correctAnswers++;
    }

    notifyListeners();
  }

  void updateCurrentQuestion(int index) {
    currentQuestion = index + 1;

    notifyListeners();
  }

  void goToNextQuestion(int id, BuildContext context) {
    if (id == questionList[questionList.length - 1].id) {
      Navigator.of(context).pushNamed(
        '/score',
        arguments: {
          "correctAnswers": correctAnswers,
        },
      );
    } else {
      isCorrect = null;

      pageController.nextPage(
        duration: Duration(milliseconds: 250),
        curve: Curves.ease,
      );
    }
  }
}
