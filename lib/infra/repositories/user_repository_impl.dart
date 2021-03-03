import 'package:dartz/dartz.dart';

import 'package:Queszz/data/repositories/user_repository.dart';
import 'package:Queszz/domain/entities/user.dart';
import 'package:Queszz/domain/helpers/failures.dart';
import 'package:Queszz/domain/usecases/login.dart';
import 'package:Queszz/infra/datasources/user_remote_datasource.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDatasource _userRemoteDatasource;

  UserRepositoryImpl(
    this._userRemoteDatasource,
  );

  @override
  Future<Either<Failure, User>> login(LoginParams params) async {
    try {
      final result = await _userRemoteDatasource.login(params);

      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
