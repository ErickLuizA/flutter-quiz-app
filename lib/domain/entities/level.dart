import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Level extends Equatable {
  final int id;
  final int stars;
  final bool alreadyTried;

  Level({
    @required this.id,
    @required this.stars,
    @required this.alreadyTried,
  });

  @override
  List<Object> get props => [id, stars, alreadyTried];

  factory Level.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Level(
      id: map['level_id'],
      stars: map['stars'],
      alreadyTried: map['already_tried'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'level_id': id,
      'stars': stars,
      'already_tried': alreadyTried,
    };
  }
}
