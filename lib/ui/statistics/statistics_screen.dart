import 'package:Queszz/presentation/viewmodels/statistics_viewmodel.dart';
import 'package:Queszz/ui/shared/load_error_widget.dart';
import 'package:Queszz/ui/shared/loading_widget.dart';
import 'package:Queszz/ui/statistics/components/statistic_item_widget.dart';
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
                : Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 40, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StatisticItemWidget(
                            text: AppLocalizations.of(context).gamesPlayed,
                            result: "${viewModel.statistics.gamesPlayed}",
                          ),
                          SizedBox(height: 10),
                          Divider(color: Colors.grey),
                          StatisticItemWidget(
                            text: AppLocalizations.of(context).gamesWon,
                            result: "${viewModel.statistics.gamesWon}",
                          ),
                          SizedBox(height: 10),
                          Divider(color: Colors.grey),
                          StatisticItemWidget(
                            text: AppLocalizations.of(context).gamesLost,
                            result: "${viewModel.statistics.gamesLost}",
                          ),
                          SizedBox(height: 10),
                          Divider(color: Colors.grey),
                          StatisticItemWidget(
                            text: AppLocalizations.of(context).totalAnswers,
                            result: "${viewModel.statistics.totalAnswers}",
                          ),
                          SizedBox(height: 10),
                          Divider(color: Colors.grey),
                          StatisticItemWidget(
                            text: AppLocalizations.of(context).correctAnswers,
                            result: "${viewModel.statistics.correctAnswers}",
                          ),
                          SizedBox(height: 10),
                          Divider(color: Colors.grey),
                          StatisticItemWidget(
                            text: AppLocalizations.of(context).wrongAnswers,
                            result: "${viewModel.statistics.wrongAnswers}",
                          ),
                          SizedBox(height: 10),
                          Divider(color: Colors.grey),
                          StatisticItemWidget(
                            text: AppLocalizations.of(context).skipedAnswers,
                            result: "${viewModel.statistics.skipedAnswers}",
                          ),
                          Divider(color: Colors.grey),
                          StatisticItemWidget(
                            text: AppLocalizations.of(context).queszzPoints,
                            result: "${viewModel.statistics.queszzPoints}",
                          ),
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }
}
