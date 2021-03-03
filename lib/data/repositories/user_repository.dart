import 'package:Queszz/domain/helpers/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, void>> login();
}
