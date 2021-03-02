import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Category extends Equatable {
  final int id;
  final String name;
  final String image;

  Category({
    @required this.id,
    @required this.name,
    @required this.image,
  });

  @override
  List<Object> get props => [id, name, image];

  factory Category.fromMap(Map<String, dynamic> map, Locale locale) {
    if (map == null) return null;

    final lang = locale.languageCode;

    return Category(
      id: map['category_id'],
      name: lang == 'pt' ? map['category_name_pt'] : map['category_name'],
      image: map['category_image'],
    );
  }
}
