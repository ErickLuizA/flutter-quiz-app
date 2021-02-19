import 'package:Queszz/domain/usecases/load_questions.dart';
import 'package:Queszz/presentation/viewmodels/questions_viewmodel.dart';
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
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    question.question,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                  SizedBox(height: 20),
                  FlatButton(
                    child: Text(question.answers[0],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )),
                    color: viewModel.isCorrect == 0
                        ? Colors.green
                        : Color(0XFF9794b3),
                    onPressed: () {
                      viewModel.checkAnswer(question.answers[0], index);

                      viewModel.goToNextQuestion(question.id, context);
                    },
                  ),
                  SizedBox(height: 10),
                  FlatButton(
                    child: Text(question.answers[1],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )),
                    color: viewModel.isCorrect == 1
                        ? Colors.green
                        : Color(0XFF9794b3),
                    onPressed: () {
                      viewModel.checkAnswer(question.answers[1], index);

                      viewModel.goToNextQuestion(question.id, context);
                    },
                  ),
                  SizedBox(height: 10),
                  FlatButton(
                    child: Text(question.answers[2],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )),
                    color: viewModel.isCorrect == 2
                        ? Colors.green
                        : Color(0XFF9794b3),
                    onPressed: () {
                      viewModel.checkAnswer(question.answers[2], index);

                      Future.delayed(Duration(seconds: 1));

                      viewModel.goToNextQuestion(question.id, context);
                    },
                  ),
                  SizedBox(height: 10),
                  FlatButton(
                    child: Text(question.answers[3],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )),
                    color: viewModel.isCorrect == 3
                        ? Colors.green
                        : Color(0XFF9794b3),
                    onPressed: () {
                      viewModel.checkAnswer(question.answers[3], index);

                      viewModel.goToNextQuestion(question.id, context);
                    },
                  ),
                  SizedBox(height: 10),
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
