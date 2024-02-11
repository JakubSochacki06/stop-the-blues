part of 'quiz_bloc.dart';

@immutable
abstract class QuizEvent extends Equatable {
  const QuizEvent();
}

class StartQuizEvent extends QuizEvent {
  @override
  List<Object?> get props => [];
}

class SubmitAnswerEvent extends QuizEvent {
  final int value;

  SubmitAnswerEvent(this.value);

  @override
  List<Object?> get props => [value];
}

class FinishQuizEvent extends QuizEvent {
  @override
  List<Object?> get props => [];
}

class BackToInitialStateEvent extends QuizEvent {
  @override
  List<Object?> get props => [];
}