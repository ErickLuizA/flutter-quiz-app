import 'package:Queszz/domain/entities/category.dart';
import 'package:Queszz/domain/entities/level.dart';
import 'package:Queszz/ui/shared/empty_start_widget.dart';
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

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total correct answers",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "${widget.correctAnswers} out 10 Questions",
                  style: TextStyle(
                    color: isWinner ? Colors.lightGreen : Colors.redAccent,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 20),
                Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  color: isWinner ? Colors.lightGreen : Colors.redAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          "Your final score is",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                      EmptyStarWidget(),
                                    ]
                                  : widget.correctAnswers >= 6
                                      ? [
                                          StarWidget(),
                                          EmptyStarWidget(),
                                          EmptyStarWidget(),
                                        ]
                                      : [
                                          EmptyStarWidget(),
                                          EmptyStarWidget(),
                                          EmptyStarWidget(),
                                        ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          "${widget.correctAnswers * 10}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                FlatButton(
                  minWidth: MediaQuery.of(context).size.width - 30,
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  color: Color(0XFF9794b3),
                  child: Text(
                    "Try again",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .popAndPushNamed('/questions', arguments: {
                      "level": widget.level,
                      "category": widget.category,
                    });
                  },
                ),
                SizedBox(height: 20),
                FlatButton(
                  minWidth: MediaQuery.of(context).size.width - 30,
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  color: Color(0XFF9794b3),
                  child: Text(
                    "Continue",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .popAndPushNamed('/levels', arguments: {
                      "category": widget.category,
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
