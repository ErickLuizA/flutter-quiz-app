import 'package:Queszz/presentation/viewmodels/questions_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:Queszz/domain/entities/question.dart';

import 'question_button.dart';

class QuestionItemWidget extends StatelessWidget {
  final Question question;
  final QuestionsViewModel viewModel;
  final int index;

  const QuestionItemWidget({
    Key key,
    @required this.question,
    @required this.viewModel,
    @required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        children: [
          Text(
            question.question,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          SizedBox(height: 30),
          QuestionButton(
            answer: question.answers[0],
            isCorrect: viewModel.isCorrect == 0,
            checkAnswer: () {
              viewModel.checkAnswer(index, 0);
            },
            goToNextQuestion: () {
              Future.delayed(Duration(milliseconds: 500), () {
                viewModel.goToNextQuestion(question.id, context);
              });
            },
          ),
          SizedBox(height: 20),
          QuestionButton(
            answer: question.answers[1],
            isCorrect: viewModel.isCorrect == 1,
            checkAnswer: () {
              viewModel.checkAnswer(index, 1);
            },
            goToNextQuestion: () {
              Future.delayed(Duration(milliseconds: 500), () {
                viewModel.goToNextQuestion(question.id, context);
              });
            },
          ),
          SizedBox(height: 20),
          QuestionButton(
            answer: question.answers[2],
            isCorrect: viewModel.isCorrect == 2,
            checkAnswer: () {
              viewModel.checkAnswer(index, 2);
            },
            goToNextQuestion: () {
              Future.delayed(Duration(milliseconds: 500), () {
                viewModel.goToNextQuestion(question.id, context);
              });
            },
          ),
          SizedBox(height: 20),
          QuestionButton(
            answer: question.answers[3],
            isCorrect: viewModel.isCorrect == 3,
            checkAnswer: () {
              viewModel.checkAnswer(index, 3);
            },
            goToNextQuestion: () {
              Future.delayed(Duration(milliseconds: 500), () {
                viewModel.goToNextQuestion(question.id, context);
              });
            },
          ),
          SizedBox(height: 20),
          FlatButton(
            child: Text(
              AppLocalizations.of(context).skipQuestion,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            onPressed: () {
              viewModel.goToNextQuestion(question.id, context);
            },
          ),
        ],
      ),
    );
  }
}
