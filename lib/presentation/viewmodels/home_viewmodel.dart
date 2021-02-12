import 'package:Queszz/domain/entities/category.dart';
import 'package:flutter/material.dart';

import 'package:Queszz/domain/usecases/load_categories.dart';

enum State { Loading, Error, Success }

class HomeViewModel extends ChangeNotifier {
  final LoadCategories _loadCategories;

  HomeViewModel(this._loadCategories);

  List<Category> categoryList = List<Category>();
  State state = State.Loading;

  Future<void> loadCategories() async {
    final result = await _loadCategories.load();

    result.fold(
      (failure) {
        state = State.Error;
      },
      (success) {
        state = State.Success;
        categoryList = success;
      },
    );

    notifyListeners();
  }
}
