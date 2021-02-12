import 'package:Queszz/data/repositories/categories_repository.dart';
import 'package:Queszz/data/usecases/load_categories_impl.dart';
import 'package:Queszz/domain/usecases/load_categories.dart';
import 'package:Queszz/external/datasources/categories_remote_datasource_impl.dart';
import 'package:Queszz/external/services/network_info_impl.dart';
import 'package:Queszz/infra/datasources/categories_remote_datasource.dart';
import 'package:Queszz/infra/repositories/categories_repository_impl.dart';
import 'package:Queszz/infra/services/network_info.dart';
import 'package:Queszz/presentation/viewmodels/home_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

HomeViewModel makeHomeViewModel() {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  CategoriesRemoteDatasource categoriesRemoteDatasource =
      CategoriesRemoteDatasourceImpl(
    firebaseFirestore: firebaseFirestore,
  );

  DataConnectionChecker dataConnectionChecker = DataConnectionChecker();

  NetworkInfo networkInfo = NetworkInfoImpl(dataConnectionChecker);

  CategoriesRepository categoriesRepository = CategoriesRepositoryImpl(
    categoriesRemoteDatasource: categoriesRemoteDatasource,
    networkInfo: networkInfo,
  );

  LoadCategories loadCategories = LoadCategoriesImpl(
    categoriesRepository: categoriesRepository,
  );

  HomeViewModel homeViewModel = HomeViewModel(loadCategories);

  return homeViewModel;
}
