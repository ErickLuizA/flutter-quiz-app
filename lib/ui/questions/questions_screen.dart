import 'package:Queszz/domain/usecases/load_questions.dart';
import 'package:Queszz/presentation/viewmodels/questions_viewmodel.dart';
import 'package:flutter/material.dart';

import 'package:Queszz/domain/entities/category.dart';
import 'package:Queszz/domain/entities/level.dart';
import 'package:provider/provider.dart';

import 'components/question_item_widget.dart';

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

            return QuestionItemWidget(
              index: index,
              question: question,
              viewModel: viewModel,
            );
          },
        ),
      ),
    );
  }
}
