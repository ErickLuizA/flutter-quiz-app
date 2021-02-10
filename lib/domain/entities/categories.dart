import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Categories extends Equatable {
  final String name;
  final String image;

  Categories({
    @required this.name,
    @required this.image,
  });

  @override
  List<Object> get props => [name, image];
}
