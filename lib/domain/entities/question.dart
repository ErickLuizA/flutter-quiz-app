import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Question extends Equatable {
  final int id;
  final String question;
  final List answers;
  final int correct;

  Question({
    @required this.id,
    @required this.question,
    @required this.answers,
    @required this.correct,
  });

  @override
  List<Object> get props => [id, question, answers, correct];

  factory Question.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Question(
      id: map['question_id'],
      question: map['question'],
      answers: map['answers'].toString().split(","),
      correct: map['correct'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'question_id': id,
      'question': question,
      'answers': answers,
      'correct': correct,
    };
  }
}
