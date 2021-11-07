import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  final _qanda = [
    {
      "questionText": "What do you want to do with this app?",
      "answers": [
        "Budget my expenses",
        "Track my investments",
        "Plan my taxes",
        "Pay off Debt",
        "Other",
      ]
    },
    {
      "questionText": "Do you know how much you are worth",
      "answers": [
        "Yes, but I owe more than I have",
        "Yes, but it is under 1 Million",
        "Yes, and I have more than 1 Million",
        "No",
        "It is complicated",
        "Other",
      ]
    },
    {
      "questionText": "Where do you live in terms of taxation",
      "answers": [
        "USA",
        "UK",
        "India",
        "I am not a tax resident anywhere",
        "Other",
      ]
    },
  ];

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
      _questionIndex = _questionIndex % _qanda.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Kanak',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Kanak'),
        ),
        body: Column(children: [
          Question(_qanda[_questionIndex]["questionText"] as String),
          ...(_qanda[_questionIndex]["answers"] as List<String>).map((answer) {
            return Answer(answer, _answerQuestion);
          }).toList(),
        ]),
      ),
    );
  }
}
