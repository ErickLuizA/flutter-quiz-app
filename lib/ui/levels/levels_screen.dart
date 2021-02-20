import 'package:Queszz/domain/usecases/load_levels.dart';
import 'package:Queszz/presentation/viewmodels/levels_viewmodel.dart';
import 'package:Queszz/ui/shared/empty_start_widget.dart';
import 'package:Queszz/ui/shared/star_widget.dart';
import 'package:flutter/material.dart';

import 'package:Queszz/domain/entities/category.dart';
import 'package:provider/provider.dart';

class LevelsScreen extends StatefulWidget {
  final Category category;

  const LevelsScreen({
    Key key,
    @required this.category,
  }) : super(key: key);

  @override
  _LevelsScreenState createState() => _LevelsScreenState();
}

class _LevelsScreenState extends State<LevelsScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<LevelsViewModel>(context, listen: false).loadLevels(
      LoadLevelsParams(widget.category.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<LevelsViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category.name,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Material(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            SizedBox(height: 20),
            if (viewModel.uiState == UIState.Loading)
              Center(
                child: CircularProgressIndicator(),
              ),
            if (viewModel.uiState == UIState.Error) Text("Error"),
            if (viewModel.uiState == UIState.Success)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(
                      viewModel.levelList.length,
                      (index) {
                        var level = viewModel.levelList[index];

                        return GestureDetector(
                          onTap: () {
                            if (level.alreadyTried || level.id == 1) {
                              Navigator.of(context).pushNamed(
                                '/questions',
                                arguments: {
                                  "level": level,
                                  "category": widget.category,
                                },
                              );
                            }
                          },
                          child: Stack(
                            children: [
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
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Level ${level.id}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              if (!level.alreadyTried && level.id != 1)
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Icon(
                                    Icons.lock,
                                    size: MediaQuery.of(context).size.width / 3,
                                    color: Color(0XFF9794b3),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
