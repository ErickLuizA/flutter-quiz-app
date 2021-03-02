import 'package:Queszz/domain/entities/category.dart';
import 'package:flutter/material.dart';

abstract class CategoriesLocalDatasource {
  Future<List<Category>> getCategories(Locale locale);
}
