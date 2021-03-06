import 'package:Queszz/domain/entities/statistics.dart';
import 'package:Queszz/domain/usecases/update_leadboard.dart';
import 'package:Queszz/presentation/viewmodels/leadboard_viewmodel.dart';
import 'package:Queszz/ui/shared/loading_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LeadboardScreen extends StatefulWidget {
  final String firebaseId;

  const LeadboardScreen({
    Key key,
    this.firebaseId,
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

                    return ListView.builder(
                      itemCount: data.docs.length,
                      itemBuilder: (context, index) {
                        final statistic = Statistics.fromMap(
                          data.docs[index].data(),
                        );

                        return Text("${statistic.queszzPoints}");
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
