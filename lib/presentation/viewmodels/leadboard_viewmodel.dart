import 'package:Queszz/domain/usecases/load_leadboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:Queszz/domain/usecases/update_leadboard.dart';

enum UIState { Loading, Error, Success }

class LeadboardViewModel extends ChangeNotifier {
  final UpdateLeadboard updateLeadboard;
  final LoadLeadboard loadLeadboard;

  LeadboardViewModel({
    @required this.updateLeadboard,
    @required this.loadLeadboard,
  });

  Future<void> update(UpdateLeadboardParams params) async {
    await updateLeadboard.update(params);
  }

  Stream<QuerySnapshot> load() => loadLeadboard.load();
}
