import 'package:Queszz/domain/entities/category.dart';

abstract class CategoriesRemoteDatasource {
  Future<List<Category>> getCategories();
}
