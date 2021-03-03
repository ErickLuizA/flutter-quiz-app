import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String email;
  final String image;

  User({
    this.name,
    this.email,
    this.image,
  });

  @override
  List<Object> get props => [name, email, image];
}
