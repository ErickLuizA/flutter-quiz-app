import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'package:Queszz/data/repositories/categories_repository.dart';
import 'package:Queszz/domain/entities/category.dart';
import 'package:Queszz/domain/helpers/failures.dart';
import 'package:Queszz/domain/usecases/load_categories.dart';

class LoadCategoriesImpl implements LoadCategories {
  final CategoriesRepository categoriesRepository;

  LoadCategoriesImpl({
    @required this.categoriesRepository,
  });

  @override
  Future<Either<Failure, List<Category>>> load() {
    return categoriesRepository.getCategories();
  }
}
