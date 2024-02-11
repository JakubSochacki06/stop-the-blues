import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stoptheblues/bloc/quiz_bloc.dart';
import 'package:stoptheblues/models/answer.dart';
import 'package:stoptheblues/models/question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => QuizBloc(),
        child: QuizPage(),
      ),
    );
  }
}

class QuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: height * 0.02, horizontal: width * 0.05),
          child: BlocBuilder<QuizBloc, QuizState>(
            builder: (context, state) {
              if (state is QuizInitial) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Cześć ', style: TextStyle(fontSize: 26)),
                                Text(
                                  'Konrad!',
                                  style: TextStyle(
                                      color: Color(0xFF1185DE), fontSize: 26),
                                )
                              ],
                            ),
                            Text(
                              'Jak się dzisiaj czujesz?',
                              style: TextStyle(
                                  fontSize: 16, color: Color(0x60000000)),
                            ),
                            // Spacer(),
                          ],
                        ),
                        Spacer(),
                        CircleAvatar(
                          radius: 35,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(35),
                              child: Image.network(
                                  'https://lh3.googleusercontent.com/a/ACg8ocJerbHBt3nS0lb723n2qH6-eZW5CAoIeJgCSk4jXmr-')),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xFF30AAFF),
                              Color(0xFF1185DE),
                            ],
                          )),
                      child: Column(
                        children: [
                          Text(
                            '„W konfrontacji między strumieniem i skałą strumień zawsze wygrywa; nie poprzez siłę, ale poprzez wytrwałość”.',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          Text('- Budda',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xFFDDEAF3)),
                      child: Stack(
                        // alignment: Alignment.bottomRight,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rozwiąż test!',
                                style: TextStyle(
                                  color: Color(0xFF1185DE),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.005,
                              ),
                              Container(
                                width: width * 0.7,
                                child: Text(
                                  'Rozwiąż krótki test wstępnie diagnozujący twój stan zdrowia psychicznego.',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0x60000000),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.005,
                              ),
                              TextButton(
                                onPressed: () {
                                  BlocProvider.of<QuizBloc>(context)
                                      .add(StartQuizEvent());
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Color(0xFF1185DE),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                child: Text(
                                  'Rozwiąż',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Image.asset(
                              'assets/note.png', // Replace with your image URL
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Text(
                      'Twoje ostatnie samopoczucia',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            decoration: BoxDecoration(
                              color: Color(0xFFDDEAF3),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '5',
                                  style: TextStyle(
                                    color: Color(0xFF1185DE),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Luty',
                                  style: TextStyle(
                                    color: Color(0xFF1185DE),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Brak depresji',
                                    style: TextStyle(
                                      color: Color(0xFF16A34A),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Nie ma potrzeby wizyty u specjalisty.',
                                    style: TextStyle(
                                        fontSize: 16, color: Color(0x60000000)),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Image.asset(
                            'assets/brakDepresji.png',
                            height: 75,
                            width: 75,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            decoration: BoxDecoration(
                              color: Color(0xFFDDEAF3),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '4',
                                  style: TextStyle(
                                    color: Color(0xFF1185DE),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Luty',
                                  style: TextStyle(
                                    color: Color(0xFF1185DE),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Brak depresji',
                                    style: TextStyle(
                                      color: Color(0xFF16A34A),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Nie ma potrzeby wizyty u specjalisty.',
                                    style: TextStyle(
                                        fontSize: 16, color: Color(0x60000000)),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Image.asset(
                            'assets/brakDepresji.png',
                            height: 75,
                            width: 75,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else if (state is QuestionState) {
                return _buildQuestionWidget(state.question, context);
              } else if (state is QuizFinishedState) {
                return _buildFinishWidget(state, context);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionWidget(Question question, BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconButton(
              iconSize: 35,
              onPressed: () {
                BlocProvider.of<QuizBloc>(context)
                    .add(BackToInitialStateEvent());
              },
              icon: Icon(
                Icons.navigate_before,
                color: Color(0xFF1185DE),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
            ),
            // Expanded(child: Text('Test', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,))
          ],
        ),
        SizedBox(height: height * 0.02),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white),
          child: Column(
            children: [
              Text(
                'Test',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height * 0.003),
              Text(
                '${question.number}/22',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF1185DE),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: height * 0.003),
              LinearProgressIndicator(
                value: question.number / 22,
                minHeight: height * 0.013,
                color: Color(0xFF1185DE),
                backgroundColor: Color(0xFFF0F0F0),
                borderRadius: BorderRadius.circular(15),
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.02),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white),
          child: Column(
            children: [
              Text(
                'Pytanie ${question.number}',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF1185DE), fontSize: 16),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Text(
                question.questionText,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.02),
        Column(
          children: question.answers
              .map((answer) => _buildAnswerButton(answer, context))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildAnswerButton(Answer answer, BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        InkWell(
          onTap: () {
            BlocProvider.of<QuizBloc>(context)
                .add(SubmitAnswerEvent(answer.value));
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.white),
            child: Text(
              answer.text,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        answer.value != 3
            ? SizedBox(
                height: height * 0.015,
              )
            : Container()
      ],
    );
  }

  Widget _buildFinishWidget(QuizFinishedState state, BuildContext context) {
    final totalScore = state.totalScore;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            iconSize: 35,
            onPressed: () {
              BlocProvider.of<QuizBloc>(context).add(BackToInitialStateEvent());
            },
            icon: Icon(
              Icons.navigate_before,
              color: Color(0xFF1185DE),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Twój wynik to:',
                  style: TextStyle(color: Color(0xFF1185DE), fontSize: 26),
                ),
                Image.asset(totalScore > 50
                    ? 'assets/depresja.png'
                    : 'assets/brakDepresji.png')
              ],
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          DottedBorder(
            color: totalScore > 50 ? Color(0xFFDC2626) : Color(0xFF16A34A),
            dashPattern: [8, 4],
            borderType: BorderType.RRect,
            radius: Radius.circular(15),
            strokeWidth: 2,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  // borderRadius: ,
                  color:
                      totalScore > 50 ? Color(0x30FECACA) : Color(0x30DCFCE7)),
              child: Column(
                children: [
                  Text(
                    totalScore > 50 ? 'Wykryto depresje!!' : 'Brak depresji',
                    style: TextStyle(
                        color: totalScore > 50
                            ? Color(0xFFDC2626)
                            : Color(0xFF16A34A),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    totalScore > 50
                        ? 'Konieczna jest wizyta u psychiatry. Jest to stan niebezpieczny dla zdrowia i życia, zwłaszcza gdy pojawiają się myśli samobójcze. Psychoterapia jest bardziej intensywna. W niektórych przypadkach konieczne jest leczenie szpitalne, aby zapobiec stanom zagrażającym życiu'
                        : 'Prawdopodobnie jest to chwilowe pogorszenie nastroju spowodowane bieżącymi wydarzeniami w Twoim życiu. Jeśli nieprzyjemne objawy nie ustąpią, wykonaj ten test po 7 dniach i porównaj wyniki, czy ulegają pogorszeniu, czy poprawie.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0x60000000),
                      fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                  ),

                ],
              ),
            ),
          ),
          Spacer(),
          TextButton(
            onPressed: () {
              BlocProvider.of<QuizBloc>(context).add(BackToInitialStateEvent());
            },
            style: TextButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
              backgroundColor: Color(0xFF1185DE),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: Text(
              'Znajdź pomoc (wkrótce)',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
