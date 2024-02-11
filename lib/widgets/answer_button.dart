import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/quiz_bloc.dart';
import '../models/answer.dart';

class AnswerButton extends StatefulWidget {
  final Answer answer;
  const AnswerButton({required this.answer});

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white),
          child: CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            value: widget.answer.isSelected,
            activeColor: Color(0xFF1185DE),
            onChanged: (value){
              setState(() {
                widget.answer.selectAnswer();
                BlocProvider.of<QuizBloc>(context).add(SelectAnswerEvent(widget.answer.value));
              });
            },
            title: Text(
              widget.answer.text,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        widget.answer.value != 3
            ? SizedBox(
          height: height * 0.015,
        )
            : Container()
      ],
    );;
  }
}
