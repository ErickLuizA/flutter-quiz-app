import 'package:Queszz/domain/usecases/update_leadboard.dart';
import 'package:Queszz/presentation/viewmodels/leadboard_viewmodel.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).leadboard),
        centerTitle: true,
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
