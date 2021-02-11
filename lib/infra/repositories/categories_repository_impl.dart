import 'package:Queszz/infra/datasources/categories_remote_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'package:Queszz/data/repositories/categories_repository.dart';
import 'package:Queszz/domain/entities/category.dart';
import 'package:Queszz/domain/helpers/failures.dart';
import 'package:Queszz/infra/services/network_info.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesRemoteDatasource categoriesRemoteDatasource;
  final NetworkInfo networkInfo;

  CategoriesRepositoryImpl({
    @required this.categoriesRemoteDatasource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await categoriesRemoteDatasource.getCategories();

        return Right(result);
      } catch (e) {
        return Left(ServerFailure());
      }
    }
  }
}
