import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Statistics extends Equatable {
  final int totalAnswers;
  final int correctAnswers;
  final int wrongAnswers;
  final int skipedAnswers;
  final int gamesPlayed;
  final int gamesWon;

  Statistics({
    @required this.totalAnswers,
    @required this.correctAnswers,
    @required this.wrongAnswers,
    @required this.skipedAnswers,
    @required this.gamesPlayed,
    @required this.gamesWon,
  });

  @override
  List<Object> get props => [
        totalAnswers,
        correctAnswers,
        wrongAnswers,
        skipedAnswers,
        gamesPlayed,
        gamesWon,
      ];

  factory Statistics.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Statistics(
      totalAnswers: map['total_answers'],
      correctAnswers: map['correct_answers'],
      wrongAnswers: map['wrong_answers'],
      skipedAnswers: map['skiped_answers'],
      gamesPlayed: map['games_played'],
      gamesWon: map['games_won'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'total_answers': totalAnswers,
      'correct_answers': correctAnswers,
      'wrong_answers': wrongAnswers,
      'skiped_answers': skipedAnswers,
      'games_played': gamesPlayed,
      'games_won': gamesWon,
    };
  }
}
