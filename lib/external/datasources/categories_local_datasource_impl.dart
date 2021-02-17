import 'package:Queszz/domain/helpers/exceptions.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';

import 'package:Queszz/domain/entities/category.dart';
import 'package:Queszz/infra/datasources/categories_local_datasource.dart';

class CategoriesLocalDatasourceImpl implements CategoriesLocalDatasource {
  final Database database;

  CategoriesLocalDatasourceImpl({
    @required this.database,
  });

  @override
  Future<List<Category>> getCategories() async {
    try {
      final result = await database.query('Categories');

      return List.generate(result.length, (i) {
        return Category.fromMap(result[i]);
      });
    } catch (e) {
      throw CacheException();
    }
  }
}
