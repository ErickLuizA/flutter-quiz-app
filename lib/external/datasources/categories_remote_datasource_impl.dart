import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import 'package:Queszz/domain/entities/category.dart';
import 'package:Queszz/infra/datasources/categories_remote_datasource.dart';

class CategoriesRemoteDatasourceImpl implements CategoriesRemoteDatasource {
  final FirebaseFirestore firebaseFirestore;

  CategoriesRemoteDatasourceImpl({
    @required this.firebaseFirestore,
  });

  @override
  Future<List<Category>> getCategories() async {
    final querySnapshot =
        await firebaseFirestore.collection('categories').get();

    final categories = querySnapshot.docs
        .map((doc) => Category(name: doc.id, image: ''))
        .toList();

    return categories;
  }
}
