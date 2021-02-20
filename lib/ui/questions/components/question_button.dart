import 'package:flutter/material.dart';

class QuestionButton extends StatelessWidget {
  final Function checkAnswer;
  final Function goToNextQuestion;
  final bool isCorrect;
  final String answer;

  const QuestionButton({
    Key key,
    @required this.checkAnswer,
    @required this.goToNextQuestion,
    @required this.isCorrect,
    @required this.answer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      minWidth: MediaQuery.of(context).size.width - 30,
      padding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Text(answer,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          )),
      color: isCorrect ? Colors.green : Color(0XFF9794b3),
      onPressed: () {
        checkAnswer();

        goToNextQuestion();
      },
    );
  }
}
