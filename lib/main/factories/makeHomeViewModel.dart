import 'package:Queszz/data/repositories/categories_repository.dart';
import 'package:Queszz/data/usecases/load_categories_impl.dart';
import 'package:Queszz/domain/usecases/load_categories.dart';
import 'package:Queszz/external/datasources/categories_local_datasource_impl.dart';
import 'package:Queszz/external/services/database.dart';
import 'package:Queszz/external/services/network_info_impl.dart';
import 'package:Queszz/infra/datasources/categories_local_datasource.dart';
import 'package:Queszz/infra/repositories/categories_repository_impl.dart';
import 'package:Queszz/infra/services/network_info.dart';
import 'package:Queszz/presentation/viewmodels/home_viewmodel.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:sqflite/sqlite_api.dart';

HomeViewModel makeHomeViewModel() {
  Database database = DatabaseHelper().database;

  CategoriesLocalDatasource categoriesLocalDatasource =
      CategoriesLocalDatasourceImpl(
    database: database,
  );

  DataConnectionChecker dataConnectionChecker = DataConnectionChecker();

  NetworkInfo networkInfo = NetworkInfoImpl(dataConnectionChecker);

  CategoriesRepository categoriesRepository = CategoriesRepositoryImpl(
    categoriesLocalDatasource: categoriesLocalDatasource,
    networkInfo: networkInfo,
  );

  LoadCategories loadCategories = LoadCategoriesImpl(
    categoriesRepository: categoriesRepository,
  );

  HomeViewModel homeViewModel = HomeViewModel(loadCategories);

  return homeViewModel;
}
