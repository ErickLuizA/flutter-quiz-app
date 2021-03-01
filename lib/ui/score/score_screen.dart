import 'package:Queszz/domain/entities/category.dart';
import 'package:Queszz/domain/entities/level.dart';
import 'package:Queszz/domain/entities/statistics.dart';
import 'package:Queszz/domain/usecases/update_level.dart';
import 'package:Queszz/domain/usecases/update_statistics.dart';
import 'package:Queszz/presentation/viewmodels/score_viewmodel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/score_box_widget.dart';

class ScoreScreen extends StatefulWidget {
  final Level level;
  final Category category;
  final int correctAnswers;
  final int wrongAnswers;
  final int skipedAnswers;

  const ScoreScreen(
      {Key key,
      @required this.correctAnswers,
      @required this.level,
      @required this.category,
      @required this.wrongAnswers,
      @required this.skipedAnswers})
      : super(key: key);

  @override
  _ScoreScreenState createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<ScoreViewModel>(context, listen: false).updateLevel(
      UpdateLevelParams(
        levelId: widget.level.id,
        categoryId: widget.category.id,
        alreadyTried: 1,
        stars: widget.correctAnswers == 10
            ? 3
            : widget.correctAnswers >= 8
                ? 2
                : widget.correctAnswers >= 6
                    ? 1
                    : 0,
      ),
    );

    Provider.of<ScoreViewModel>(context, listen: false).updateStatistics(
      UpdateStatisticsParams(
        Statistics(
          totalAnswers: 10,
          correctAnswers: widget.correctAnswers,
          wrongAnswers: widget.wrongAnswers,
          skipedAnswers: widget.skipedAnswers,
          gamesPlayed: 1,
          gamesWon: widget.correctAnswers >= 6 ? 1 : 0,
          gamesLost: widget.correctAnswers >= 6 ? 0 : 1,
        ),
      ),
    );
  }

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
                  AppLocalizations.of(context).totalCorrectAnswers,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                SizedBox(height: 5),
                Text(
                  "${widget.correctAnswers} ${AppLocalizations.of(context).out10}",
                  style: TextStyle(
                    color: isWinner ? Colors.lightGreen : Colors.redAccent,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 20),
                ScoreBoxWidget(
                  isWinner: isWinner,
                  correctAnswers: widget.correctAnswers,
                ),
                SizedBox(height: 20),
                FlatButton(
                  minWidth: MediaQuery.of(context).size.width - 30,
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  color: Theme.of(context).accentColor,
                  child: Text(
                    AppLocalizations.of(context).tryAgain,
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
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  color: Theme.of(context).accentColor,
                  child: Text(
                    AppLocalizations.of(context).keepGoing,
                    style: Theme.of(context).textTheme.bodyText2,
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
