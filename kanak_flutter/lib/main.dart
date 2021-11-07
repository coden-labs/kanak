import 'package:flutter/material.dart';


import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _qanda = const [
    {
      "questionText": "What is your favourite colour?",
      "answers": [
        {"text": "Red", "score": 10},
        {"text": "Black", "score": 5},
        {"text": "White", "score": 3},
        {"text": "Yellow", "score": 2},
      ]
    },
    {
      "questionText": "What is your favourite animal?",
      "answers": [
        {"text": "Rhino", "score": 10},
        {"text": "Elephant", "score": 5},
        {"text": "Rat", "score": 20},
        {"text": "Unicorn", "score": -20},
      ]
    },
    {
      "questionText": "What is your favourite food?",
      "answers": [
        {"text": "Katsu Curry", "score": 10},
        {"text": "Sphagetti & Meat Balls", "score": 5},
        {"text": "Sushi", "score": 3},
        {"text": "Pizza", "score": 2},
      ]
    },
  ];

  void _answerQuestion(int score) {
    setState(() {
      // This increases the questionIndex to be equal to qanda's length. So that means
      // at the end we have
      if (_questionIndex < _qanda.length) {
        _questionIndex = _questionIndex + 1;
        _totalScore += score;
      }
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget displayWidget = Result(_totalScore, _resetQuiz);

    if (_questionIndex < _qanda.length) {
      displayWidget = Quiz(
          qanda: _qanda,
          questionIndex: _questionIndex,
          answerQuestion: _answerQuestion);
    }

    return MaterialApp(
      title: 'Welcome to Kanak',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Kanak'),
        ),
        body: displayWidget,
      ),
    );
  }
}
