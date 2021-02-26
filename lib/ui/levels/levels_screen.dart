import 'package:Queszz/domain/usecases/load_levels.dart';
import 'package:Queszz/presentation/viewmodels/levels_viewmodel.dart';
import 'package:Queszz/ui/shared/load_error_widget.dart';
import 'package:Queszz/ui/shared/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:Queszz/domain/entities/category.dart';
import 'package:provider/provider.dart';

import 'components/level_item_widget.dart';

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
            if (viewModel.uiState == UIState.Loading) LoadingWidget(),
            if (viewModel.uiState == UIState.Error)
              LoadErrorWidget(
                text: AppLocalizations.of(context).errorLevels,
                retry: () {
                  viewModel.loadLevels(
                    LoadLevelsParams(widget.category.id),
                  );
                },
              ),
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

                        final alreadyTried = viewModel.levelList.map((item) {
                          if (item.alreadyTried || item.id == 1) {
                            return item;
                          }
                        }).toList();

                        return LevelItemWidget(
                          category: widget.category,
                          level: level,
                          alreadyTried: alreadyTried,
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
