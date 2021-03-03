import 'package:Queszz/domain/helpers/failures.dart';
import 'package:dartz/dartz.dart';

abstract class Login {
  Future<Either<Failure, void>> execute();
}
