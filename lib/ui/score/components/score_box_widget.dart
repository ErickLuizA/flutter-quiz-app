import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:Queszz/ui/shared/empty_start_widget.dart';
import 'package:Queszz/ui/shared/star_widget.dart';

class ScoreBoxWidget extends StatelessWidget {
  final int correctAnswers;
  final bool isWinner;

  const ScoreBoxWidget({
    Key key,
    @required this.correctAnswers,
    @required this.isWinner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
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
              AppLocalizations.of(context).finalScore,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: correctAnswers == 10
                  ? [
                      StarWidget(),
                      StarWidget(),
                      StarWidget(),
                    ]
                  : correctAnswers >= 8
                      ? [
                          StarWidget(),
                          StarWidget(),
                          EmptyStarWidget(),
                        ]
                      : correctAnswers >= 6
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
              "${correctAnswers * 10}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
