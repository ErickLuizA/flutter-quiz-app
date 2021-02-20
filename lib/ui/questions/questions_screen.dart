import 'package:Queszz/domain/usecases/load_questions.dart';
import 'package:Queszz/presentation/viewmodels/questions_viewmodel.dart';
import 'package:Queszz/ui/questions/components/question_button.dart';
import 'package:flutter/material.dart';

import 'package:Queszz/domain/entities/category.dart';
import 'package:Queszz/domain/entities/level.dart';
import 'package:provider/provider.dart';

class QuestionsScreen extends StatefulWidget {
  final Level level;
  final Category category;

  const QuestionsScreen({
    Key key,
    @required this.level,
    @required this.category,
  }) : super(key: key);

  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<QuestionsViewModel>(context, listen: false).loadQuestions(
      LoadQuestionsParams(
        categoryId: widget.category.id,
        levelId: widget.level.id,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<QuestionsViewModel>(context);

    viewModel.category = widget.category;
    viewModel.level = widget.level;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${viewModel.currentQuestion}/${viewModel.questionList.length}",
        ),
        centerTitle: true,
      ),
      body: Material(
        color: Theme.of(context).primaryColor,
        child: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          controller: viewModel.pageController,
          onPageChanged: viewModel.updateCurrentQuestion,
          itemCount: viewModel.questionList.length,
          itemBuilder: (context, index) {
            var question = viewModel.questionList[index];

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
                      "Skip question",
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
          },
        ),
      ),
    );
  }
}
