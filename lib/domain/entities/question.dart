import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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

  factory Question.fromMap(Map<String, dynamic> map, Locale locale) {
    if (map == null) return null;

    final lang = locale.languageCode;

    return Question(
      id: map['question_id'],
      question: lang == 'pt' ? map['question_pt'] : map['question'],
      answers: lang == 'pt'
          ? map['answers_pt'].toString().split(",")
          : map['answers'].toString().split(","),
      correct: map['correct'],
    );
  }
}
