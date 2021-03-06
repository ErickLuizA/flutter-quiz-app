import 'package:dartz/dartz.dart';

import 'package:Queszz/domain/helpers/failures.dart';
import 'package:flutter/material.dart';

class UpdateLeadboardParams {
  final String firebaseId;
  final String name;

  UpdateLeadboardParams({
    @required this.firebaseId,
    @required this.name,
  });
}

abstract class UpdateLeadboard {
  Future<Either<Failure, void>> update(UpdateLeadboardParams params);
}
