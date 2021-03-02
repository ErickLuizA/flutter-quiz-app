import 'package:Queszz/domain/entities/category.dart';
import 'package:flutter/material.dart';

import 'package:Queszz/domain/usecases/load_categories.dart';

enum UIState { Loading, Error, Success }

class HomeViewModel extends ChangeNotifier {
  final LoadCategories _loadCategories;

  HomeViewModel(this._loadCategories);

  List<Category> categoryList = List<Category>();
  UIState uiState = UIState.Loading;

  Future<void> loadCategories(Locale locale) async {
    final result = await _loadCategories.load(locale);

    result.fold(
      (failure) {
        uiState = UIState.Error;
      },
      (success) {
        uiState = UIState.Success;
        categoryList = success;
      },
    );

    notifyListeners();
  }
}
