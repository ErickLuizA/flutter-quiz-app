import 'package:Queszz/domain/entities/user.dart';
import 'package:Queszz/domain/helpers/failures.dart';
import 'package:Queszz/domain/usecases/login.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> login(LoginParams params);
}
