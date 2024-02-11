import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:stoptheblues/models/answer.dart';
import 'package:stoptheblues/models/question.dart';

part 'quiz_event.dart';

part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  late List<Question> _questions;
  int _currentIndex = 0;
  int _totalScore = 0;
  int? _selectedAnswerIndex;
  int get currentIndex => _currentIndex + 1;
  int get totalQuestions => _questions.length;
  int get totalScore => _totalScore;
  int? get selectedAnswerIndex => _selectedAnswerIndex;

  QuizBloc() : super(QuizInitial()) {
    _questions = [
      Question(
        number: 1,
        questionText: "Jak czujesz się ostatnio?",
        answers: [
          Answer(text: "Nie jestem smutny ani przygnębiony.", value: 0),
          Answer(text: "Odczuwam często smutek, przygnębienie", value: 1),
          Answer(text: "Przeżywam stale smutek, przygnębienie i nie mogę uwolnić się od tych przeżyć.", value: 2),
          Answer(text: "Jestem stale tak smutny i nieszczęśliwy, że jest to nie do wytrzymania.", value: 3),
        ],
      ),
      Question(
        number: 2,
        questionText: "Czy przejmujesz się przyszłością?",
        answers: [
          Answer(text: "Nie przejmuję się zbytnio przyszłością.", value: 0),
          Answer(text: "Często martwię się o przyszłość.", value: 1),
          Answer(text: "Obawiam się, że w przyszłości nic dobrego mnie nie czeka.", value: 2),
          Answer(text: "Czuję, że przyszłość jest beznadziejna i nic tego nie zmieni.", value: 3),
        ],
      ),
      Question(
        number: 3,
        questionText: "Czy zaniedbujesz ostatnio niektóre rzeczy?",
        answers: [
          Answer(text: "Sądzę, że nie popełniam większych zaniedbań.", value: 0),
          Answer(text: "Sądzę, że czynię więcej zaniedbań niż inni.", value: 1),
          Answer(text: "Kiedy spoglądam na to, co robiłem, widzę mnóstwo błędów i zaniedbań.", value: 2),
          Answer(text: "Jestem zupełnie niewydolny i wszystko robię źle.", value: 3),
        ],
      ),
      Question(
        number: 4,
        questionText: "Czy to co robisz sprawia Ci przyjemność?",
        answers: [
          Answer(text: "To, co robię, sprawia mi przyjemność.", value: 0),
          Answer(text: "Nie cieszy mnie to, co robię.", value: 1),
          Answer(text: "Nic mi teraz nie daje prawdziwego zadowolenia.", value: 2),
          Answer(text: "Nie potrafię przeżywać zadowolenia i przyjemności, wszystko mnie nuży.", value: 3),
        ],
      ),
      Question(
        number: 5,
        questionText: "Czy czujesz się winnym lub masz wyrzuty sumienia?",
        answers: [
          Answer(text: "Nie czuję się winnym ani wobec siebie, ani wobec innych.", value: 0),
          Answer(text: "Dość często miewam wyrzuty sumienia.", value: 1),
          Answer(text: "Często czuję, że zawiniłem.", value: 2),
          Answer(text: "Stale czuję się winny.", value: 3),
        ],
      ),
      Question(
        number: 6,
        questionText: "Czy czujesz się karany?",
        answers: [
          Answer(text: "Sądzę, że nie zasługuję na karę.", value: 0),
          Answer(text: "Sądzę, że zasługuję na karę.", value: 1),
          Answer(text: "Spodziewam się ukarania.", value: 2),
          Answer(text: "Wiem, że jestem karany (lub ukarany).", value: 3),
        ],
      ),
      Question(
        number: 7,
        questionText: "Czy jesteś z siebie zadowolony?",
        answers: [
          Answer(text: "Jestem z siebie zadowolony.", value: 0),
          Answer(text: "Nie jestem z siebie zadowolony.", value: 1),
          Answer(text: "Czuję do siebie niechęć.", value: 2),
          Answer(text: "Nienawidzę siebie.", value: 3),
        ],
      ),
      Question(
        number: 8,
        questionText: "Czy czujesz się gorszy od innych?",
        answers: [
          Answer(text: "Nie czuję się gorszy od innych ludzi.", value: 0),
          Answer(text: "Zarzucam sobie, że jestem nieudolny i popełniam błędy.", value: 1),
          Answer(text: "Stale potępiam siebie za popełnione błędy.", value: 2),
          Answer(text: "Winię siebie za wszelkie zło, które istnieje.", value: 3),
        ],
      ),
      Question(
        number: 9,
        questionText: "Czy myślisz o odebraniu sobie życia?",
        answers: [
          Answer(text: "Nie myślę o odebraniu sobie życia.", value: 0),
          Answer(text: "Myślę o samobójstwie, ale nie mógłbym tego dokonać.", value: 1),
          Answer(text: "Pragnę odebrać sobie życie.", value: 2),
          Answer(text: "Popełnię samobójstwo, jak będzie odpowiednia sposobność.", value: 3),
        ],
      ),
      Question(
        number: 10,
        questionText: "Jak często płaczesz?",
        answers: [
          Answer(text: "Nie płaczę częściej niż zwykle.", value: 0),
          Answer(text: "Płaczę częściej niż dawniej.", value: 1),
          Answer(text: "Ciągle chce mi się płakać.", value: 2),
          Answer(text: "Chciałbym płakać, lecz nie jestem w stanie.", value: 3),
        ],
      ),
      Question(
        number: 11,
        questionText: "Czy jesteś poddenerwowany?",
        answers: [
          Answer(text: "Nie jestem bardziej podenerwowany niż dawniej.", value: 0),
          Answer(text: "Jestem bardziej nerwowy i przykry niż dawniej.", value: 1),
          Answer(text: "Jestem stale zdenerwowany lub rozdrażniony.", value: 2),
          Answer(text: "Wszystko, co dawniej mnie drażniło, stało się obojętne.", value: 3),
        ],
      ),
      Question(
        number: 12,
        questionText: "Czy ludzie Cię interesują?",
        answers: [
          Answer(text: "Ludzie interesują mnie jak dawniej.", value: 0),
          Answer(text: "Interesuję się ludźmi mniej niż dawniej.", value: 1),
          Answer(text: "Utraciłem większość zainteresowań innymi ludźmi.", value: 2),
          Answer(text: "Utraciłem wszelkie zainteresowanie innymi ludźmi.", value: 3),
        ],
      ),
      Question(
        number: 13,
        questionText: "Jak przychodzi Ci podejmowanie decyzji?",
        answers: [
          Answer(text: "Decyzje podejmuję łatwo, tak jak dawniej.", value: 0),
          Answer(text: "Częściej niż kiedyś odwlekam podjęcie decyzji.", value: 1),
          Answer(text: "Mam dużo trudności z podjęciem decyzji.", value: 2),
          Answer(text: "Nie jestem w stanie podjąć żadnej decyzji.", value: 3),
        ],
      ),
      Question(
        number: 14,
        questionText: "Co sądzisz o swoim wyglądzie?",
        answers: [
          Answer(text: "Sądzę, że wyglądam nie gorzej niż dawniej.", value: 0),
          Answer(text: "Martwię się tym, że wyglądam staro i nieatrakcyjnie.", value: 1),
          Answer(text: "Czuję, że wyglądam coraz gorzej.", value: 2),
          Answer(text: "Jestem przekonany, że wyglądam okropnie i odpychająco.", value: 3),
        ],
      ),
      Question(
        number: 15,
        questionText: "Jak oceniasz swoją możliwość pracy?",
        answers: [
          Answer(text: "Mogę pracować jak dawniej.", value: 0),
          Answer(text: "Z trudem rozpoczynam każdą czynność.", value: 1),
          Answer(text: "Z wielkim wysiłkiem zmuszam się do zrobienia czegokolwiek.", value: 2),
          Answer(text: "Nie jestem w stanie nic zrobić.", value: 3),
        ],
      ),
      Question(
        number: 16,
        questionText: "Jak ostatnio sypiasz?",
        answers: [
          Answer(text: "Sypiam dobrze, jak zwykle", value: 0),
          Answer(text: "Sypiam gorzej niż dawniej", value: 1),
          Answer(text: "Rano budzę się 1-2 godziny za wcześnie i trudno jest mi ponownie usnąć", value: 2),
          Answer(text: "Budzę się kilka godzin za wcześnie i nie mogę usnąć", value: 3),
        ],
      ),
      Question(
        number: 17,
        questionText: "Czy męczysz się bardziej niż zawsze?",
        answers: [
          Answer(text: "Nie męczę się bardziej niż dawniej", value: 0),
          Answer(text: "Męczę się znacznie łatwiej niż poprzednio", value: 1),
          Answer(text: "Męczę się wszystkim, co robię", value: 2),
          Answer(text: "Jestem zbyt zmęczony, aby cokolwiek robić", value: 3),
        ],
      ),
      Question(
        number: 18,
        questionText: "Jaki masz ostatnio apetyt?",
        answers: [
          Answer(text: "Mam apetyt nie gorszy niż dawniej", value: 0),
          Answer(text: "Mam trochę gorszy apetyt", value: 1),
          Answer(text: "Apetyt mam wyraźnie gorszy", value: 2),
          Answer(text: "Nie mam w ogóle apetytu", value: 3),
        ],
      ),
      Question(
        number: 19,
        questionText: "Czy jesz mniej aby stracić na wadze?",
        answers: [
          Answer(text: "Nie tracę na wadze (w okresie ostatniego miesiąca)", value: 0),
          Answer(text: "Straciłem na wadze więcej niż 2 kg", value: 1),
          Answer(text: "Straciłem na wadze więcej niż 4 kg", value: 2),
          Answer(text: "Straciłem na wadze więcej niż 6 kg", value: 3),
        ],
      ),
      Question(
        number: 20,
        questionText: "Jadam specjalnie mniej, aby stracić na wadze:",
        answers: [
          Answer(text: "Tak", value: 1),
          Answer(text: "Nie", value: 0),
        ],
      ),
      Question(
        number: 21,
        questionText: "Czy martwisz się o swoje zdrowie?",
        answers: [
          Answer(text: "Nie martwię się o swoje zdrowie bardziej niż zawsze", value: 0),
          Answer(text: "Martwię się swoimi dolegliwościami, mam rozstrój żołądka, zaparcie, bóle", value: 1),
          Answer(text: "Stan mojego zdrowia bardzo mnie martwi, często o tym myślę", value: 2),
          Answer(text: "Tak bardzo martwię się o swoje zdrowie, że nie mogę o niczym innym myśleć", value: 3),
        ],
      ),
      Question(
        number: 22,
        questionText: "Czy twoje zainteresowania seksualne uległy zmianom?",
        answers: [
          Answer(text: "Moje zainteresowania seksualne nie uległy zmianom", value: 0),
          Answer(text: "Jestem mniej zainteresowany sprawami płci (seksu)", value: 1),
          Answer(text: "Problemy płciowe wyraźnie mniej mnie interesują", value: 2),
          Answer(text: "Utraciłem wszelkie zainteresowanie sprawami seksu", value: 3),
        ],
      ),
    ];
    on<StartQuizEvent>(_onStartQuiz);
    on<SelectAnswerEvent>(_onSelectAnswer);
    on<SubmitAnswerEvent>(_onSubmitAnswer);
    on<FinishQuizEvent>(_onFinishQuiz);
    on<BackToInitialStateEvent>(_backToInitialStateEvent);
  }

  void _onStartQuiz(StartQuizEvent event, Emitter<QuizState> emit) {
    _totalScore = 0;
    emit(QuestionState(_questions.first));
  }

  void _onSelectAnswer(SelectAnswerEvent event, Emitter<QuizState> emit){
    _selectedAnswerIndex = event.answerIndex;
    emit(QuestionState(_questions[_currentIndex]));
}

  void _onSubmitAnswer(SubmitAnswerEvent event, Emitter<QuizState> emit) {
    if (state is QuestionState) {
      final QuestionState currentState = state as QuestionState;
      final Question currentQuestion = currentState.question;
      _totalScore += _selectedAnswerIndex == null?0:_selectedAnswerIndex!;
      print(_totalScore);
      _currentIndex = _questions.indexOf(currentQuestion);
      if (_currentIndex < _questions.length - 1) {
        _currentIndex++;
        _selectedAnswerIndex = null;
        emit(QuestionState(_questions[_currentIndex]));
      } else {
        emit(QuizFinishedState(totalScore: _totalScore));
      }
    }
  }

  void _onFinishQuiz(FinishQuizEvent event, Emitter<QuizState> emit) {
    emit(QuizFinishedState(totalScore: _totalScore));
    _totalScore = 0;
    _currentIndex = 0;
  }

  void _backToInitialStateEvent(BackToInitialStateEvent event, Emitter<QuizState> emit){
    _questions.forEach((element) {element.answers.forEach((element) {element.isSelected = false;});});
    emit(QuizInitial());
  }
}
