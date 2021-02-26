import 'package:Queszz/domain/entities/category.dart';
import 'package:Queszz/domain/entities/level.dart';
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
  int wrongAnswers = 0;
  int skipedAnswers = 0;

  int isCorrect;

  Level level;
  Category category;

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

  void checkAnswer(int index, int answerIndex) {
    if (answerIndex == questionList[index].correct) {
      isCorrect = answerIndex;
      correctAnswers = correctAnswers + 1;
    } else {
      wrongAnswers = wrongAnswers + 1;
    }

    notifyListeners();
  }

  void updateCurrentQuestion(int index) {
    currentQuestion = index + 1;

    notifyListeners();
  }

  void goToNextQuestion(int id, BuildContext context, {bool isSkip = false}) {
    if (isSkip) {
      skipedAnswers = skipedAnswers + 1;
    }

    if (id == questionList[questionList.length - 1].id) {
      Navigator.of(context).popAndPushNamed(
        '/score',
        arguments: {
          "level": level,
          "category": category,
          "correctAnswers": correctAnswers,
          "wrongAnswers": wrongAnswers,
          "skipedAnswers": skipedAnswers,
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
