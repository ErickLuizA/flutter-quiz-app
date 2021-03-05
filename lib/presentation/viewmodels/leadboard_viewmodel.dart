import 'package:flutter/material.dart';

import 'package:Queszz/domain/usecases/update_leadboard.dart';

enum UIState { Loading, Error, Success }

class LeadboardViewModel extends ChangeNotifier {
  final UpdateLeadboard updateLeadboard;

  LeadboardViewModel({
    this.updateLeadboard,
  });

  Future<void> update(UpdateLeadboardParams params) async {
    await updateLeadboard.update(params);
  }
}
