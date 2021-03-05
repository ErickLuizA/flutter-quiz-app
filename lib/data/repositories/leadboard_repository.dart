import 'package:Queszz/domain/helpers/failures.dart';
import 'package:Queszz/domain/usecases/update_leadboard.dart';
import 'package:dartz/dartz.dart';

abstract class LeadboardRepository {
  Future<Either<Failure, void>> update(UpdateLeadboardParams params);
}
