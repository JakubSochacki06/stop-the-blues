part of 'quiz_bloc.dart';

@immutable
abstract class QuizState extends Equatable {
  const QuizState();
}

class QuizInitial extends QuizState {
  @override
  List<Object?> get props => [];
}

class QuestionState extends QuizState {
  final Question question;

  QuestionState(this.question);

  @override
  List<Object?> get props => [question];
}

class QuizFinishedState extends QuizState {
  final int totalScore;

  QuizFinishedState({required this.totalScore});

  @override
  List<Object?> get props => [totalScore];
}
