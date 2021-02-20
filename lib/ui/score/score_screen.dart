import 'package:Queszz/domain/entities/category.dart';
import 'package:Queszz/domain/entities/level.dart';
import 'package:Queszz/ui/shared/star_widget.dart';
import 'package:flutter/material.dart';

class ScoreScreen extends StatefulWidget {
  final Level level;
  final Category category;
  final int correctAnswers;

  const ScoreScreen({
    Key key,
    @required this.correctAnswers,
    @required this.level,
    @required this.category,
  }) : super(key: key);

  @override
  _ScoreScreenState createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  Widget build(BuildContext context) {
    bool isWinner = widget.correctAnswers >= 6;

    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Text(
            "Total correct answers",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            "${widget.correctAnswers} out 10 Questions",
            style: TextStyle(
              color: isWinner ? Colors.lightGreen : Colors.redAccent,
            ),
          ),
          Material(
            color: isWinner ? Colors.lightGreen : Colors.redAccent,
            child: Column(
              children: [
                Text(
                  "Your final score is",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: widget.correctAnswers == 10
                      ? [
                          StarWidget(),
                          StarWidget(),
                          StarWidget(),
                        ]
                      : widget.correctAnswers >= 8
                          ? [
                              StarWidget(),
                              StarWidget(),
                              Icon(Icons.star_border),
                            ]
                          : widget.correctAnswers >= 6
                              ? [
                                  StarWidget(),
                                  Icon(Icons.star_border),
                                  Icon(Icons.star_border),
                                ]
                              : [
                                  Icon(Icons.star_border),
                                  Icon(Icons.star_border),
                                  Icon(Icons.star_border),
                                ],
                ),
              ],
            ),
          ),
          FlatButton(
            child: Text("Try again"),
            onPressed: () {
              Navigator.of(context).popAndPushNamed('/questions', arguments: {
                "level": widget.level,
                "category": widget.category,
              });
            },
          ),
          FlatButton(
            child: Text("Continue"),
            onPressed: () {
              Navigator.of(context).popAndPushNamed('/levels', arguments: {
                "category": widget.category,
              });
            },
          ),
        ],
      ),
    );
  }
}
