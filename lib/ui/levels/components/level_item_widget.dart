import 'package:Queszz/domain/entities/category.dart';
import 'package:Queszz/ui/shared/empty_start_widget.dart';
import 'package:Queszz/ui/shared/star_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import 'package:Queszz/domain/entities/level.dart';

class LevelItemWidget extends StatelessWidget {
  final Level level;
  final Category category;
  final List<Level> alreadyTried;

  const LevelItemWidget({
    Key key,
    @required this.level,
    @required this.category,
    @required this.alreadyTried,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lastLevel = alreadyTried.lastWhere((item) => item != null);

    return GestureDetector(
      onTap: () {
        if (alreadyTried.contains(level) ||
            level.id == lastLevel.id + 1 && lastLevel.alreadyTried) {
          Navigator.of(context).pushNamed(
            '/questions',
            arguments: {
              "level": level,
              "category": category,
            },
          );
        }
      },
      child: Stack(
        children: [
          if (alreadyTried.contains(level) ||
              level.id == lastLevel.id + 1 && lastLevel.alreadyTried)
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: level.stars == 3
                      ? [
                          StarWidget(),
                          StarWidget(),
                          StarWidget(),
                        ]
                      : level.stars == 2
                          ? [
                              StarWidget(),
                              StarWidget(),
                              EmptyStarWidget(),
                            ]
                          : level.stars == 1
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
                Text(
                  "?",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Text(
                  "${AppLocalizations.of(context).level} ${level.id}",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            )
          else
            Align(
              alignment: Alignment.topCenter,
              child: Icon(
                Icons.lock,
                size: MediaQuery.of(context).size.width / 3,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
        ],
      ),
    );
  }
}
