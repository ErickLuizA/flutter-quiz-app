import 'package:Queszz/domain/entities/category.dart';

abstract class CategoriesLocalDatasource {
  Future<List<Category>> getCategories();
}
