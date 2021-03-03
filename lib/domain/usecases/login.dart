import 'package:Queszz/domain/entities/user.dart';
import 'package:Queszz/domain/helpers/failures.dart';
import 'package:dartz/dartz.dart';

class LoginParams {}

abstract class Login {
  Future<Either<Failure, User>> execute(LoginParams params);
}
