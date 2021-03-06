import 'package:Queszz/domain/usecases/update_leadboard.dart';

abstract class LeadboardRemoteDatasource {
  Future<void> update(UpdateLeadboardParams params);

  Stream load();
}
