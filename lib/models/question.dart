import 'answer.dart';

class Question {
  final String questionText;
  final List<Answer> answers;
  final int number;

  Question({required this.questionText, required this.answers, required this.number});

  List<Object?> get props => [questionText, answers, number];
}