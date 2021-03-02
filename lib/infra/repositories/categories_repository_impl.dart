import 'package:Queszz/infra/datasources/categories_local_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:Queszz/data/repositories/categories_repository.dart';
import 'package:Queszz/domain/entities/category.dart';
import 'package:Queszz/domain/helpers/failures.dart';
import 'package:Queszz/infra/services/network_info.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesLocalDatasource categoriesLocalDatasource;
  final NetworkInfo networkInfo;

  CategoriesRepositoryImpl({
    @required this.categoriesLocalDatasource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Category>>> getCategories(Locale locale) async {
    try {
      final result = await categoriesLocalDatasource.getCategories(locale);

      return Right(result);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
