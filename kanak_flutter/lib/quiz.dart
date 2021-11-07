import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {

  final List<Map<String, Object>> qanda;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({required this.qanda, required this.questionIndex, required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(qanda[questionIndex]["questionText"] as String),
      ...(qanda[questionIndex]["answers"] as List<Map<String, Object>>).map((answer) {
        return Answer((answer["text"] as String), () => answerQuestion(answer["score"] as int));
      }).toList(),
    ]);
  }
}