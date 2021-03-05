import 'package:Queszz/data/repositories/leadboard_repository.dart';
import 'package:Queszz/infra/datasources/leadboard_remote_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:Queszz/domain/usecases/update_leadboard.dart';
import 'package:Queszz/domain/helpers/failures.dart';

class LeadboardRepositoryImpl implements LeadboardRepository {
  final LeadboardRemoteDatasource _leadboardRemoteDatasource;

  LeadboardRepositoryImpl(this._leadboardRemoteDatasource);

  @override
  Future<Either<Failure, void>> update(UpdateLeadboardParams params) async {
    try {
      final result = await _leadboardRemoteDatasource.update(params);

      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
