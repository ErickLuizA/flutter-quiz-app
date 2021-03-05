import 'package:dartz/dartz.dart';

import 'package:Queszz/domain/helpers/failures.dart';

class UpdateLeadboardParams {
  final String firebaseId;

  UpdateLeadboardParams({
    this.firebaseId,
  });
}

abstract class UpdateLeadboard {
  Future<Either<Failure, void>> update(UpdateLeadboardParams params);
}
