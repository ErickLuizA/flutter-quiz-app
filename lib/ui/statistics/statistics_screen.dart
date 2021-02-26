import 'package:Queszz/presentation/viewmodels/statistics_viewmodel.dart';
import 'package:Queszz/ui/shared/load_error_widget.dart';
import 'package:Queszz/ui/shared/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StatisticsScreen extends StatefulWidget {
  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<StatisticsViewModel>(context, listen: false).loadStatistics();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<StatisticsViewModel>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: viewModel.uiState == UIState.Loading
            ? LoadingWidget()
            : viewModel.uiState == UIState.Error
                ? LoadErrorWidget(
                    text: AppLocalizations.of(context).errorStatistics,
                    retry: () {
                      viewModel.loadStatistics();
                    },
                  )
                : Column(
                    children: [
                      Row(
                        children: [
                          Text("Games played"),
                          Text("${viewModel.statistics.gamesPlayed}"),
                        ],
                      )
                    ],
                  ),
      ),
    );
  }
}
