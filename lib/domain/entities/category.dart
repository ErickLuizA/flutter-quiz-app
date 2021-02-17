import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

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

  factory Category.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Category(
      id: map['category_id'],
      name: map['category_name'],
      image: map['category_image'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'category_id': id,
      'category_name': name,
      'category_image': image,
    };
  }
}
