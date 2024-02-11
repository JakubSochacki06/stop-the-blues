part of 'quiz_bloc.dart';

@immutable
abstract class QuizEvent extends Equatable {
  const QuizEvent();
}

class StartQuizEvent extends QuizEvent {
  @override
  List<Object?> get props => [];
}

class SelectAnswerEvent extends QuizEvent {
  final int answerIndex;

  SelectAnswerEvent(this.answerIndex);

  @override
  List<Object?> get props => [answerIndex];
}

class SubmitAnswerEvent extends QuizEvent {

  SubmitAnswerEvent();

  @override
  List<Object?> get props => [];
}

class FinishQuizEvent extends QuizEvent {
  @override
  List<Object?> get props => [];
}

class BackToInitialStateEvent extends QuizEvent {
  @override
  List<Object?> get props => [];
}