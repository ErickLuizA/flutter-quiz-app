import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'package:Queszz/domain/usecases/update_leadboard.dart';
import 'package:Queszz/presentation/viewmodels/leadboard_viewmodel.dart';
import 'package:Queszz/ui/shared/loading_widget.dart';

class Statistic {
  final String name;
  final int points;

  Statistic({
    this.name,
    this.points,
  });

  factory Statistic.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Statistic(
      name: map['name'],
      points: map['queszz_points'] ?? 0,
    );
  }
}

class LeadboardScreen extends StatefulWidget {
  final String firebaseId;
  final String name;

  const LeadboardScreen({
    Key key,
    this.firebaseId,
    this.name,
  }) : super(key: key);

  @override
  _LeadboardScreenState createState() => _LeadboardScreenState();
}

class _LeadboardScreenState extends State<LeadboardScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<LeadboardViewModel>(context, listen: false).update(
      UpdateLeadboardParams(
        firebaseId: widget.firebaseId,
        name: widget.name,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<LeadboardViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).leadboard),
        centerTitle: true,
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder(
                  stream: viewModel.load(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return LoadingWidget();
                    } else {
                      final data = snapshot.data as QuerySnapshot;

                      data.docs.sort(
                        (a, b) =>
                            a.data()['queszz_points'] ??
                            0 > b.data()['queszz_points'] ??
                            0,
                      );

                      final userDoc = data.docs
                          .where((snapshot) => snapshot.id == widget.firebaseId)
                          .first;

                      final userStatistic = Statistic.fromMap(userDoc.data());

                      final userIndex = data.docs.lastIndexWhere(
                          (snapshot) => snapshot.id == widget.firebaseId);

                      return Stack(
                        children: [
                          ListView.builder(
                            itemCount: data.docs.length,
                            itemBuilder: (context, index) {
                              final statistic = Statistic.fromMap(
                                data.docs[index].data(),
                              );

                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 3,
                                  vertical: 6,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("${index + 1} ${statistic.name}"),
                                    Text("${statistic.points} qp"),
                                  ],
                                ),
                              );
                            },
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${userIndex + 1} ${userStatistic.name}"),
                                Text("${userStatistic.points} qp"),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
