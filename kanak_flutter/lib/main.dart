// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import './question.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}


class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _questions = [
    "What do you want to do with this app?",
    "Do you know how much you are worth?",
    "Where do you live in terms of taxation?",
  ];

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
      _questionIndex = _questionIndex % _questions.length;
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
          Question(_questions[_questionIndex]),
          RaisedButton(child: Text('Answer 1'), onPressed: _answerQuestion),
          RaisedButton(child: Text('Answer 2'), onPressed: _answerQuestion),
          RaisedButton(child: Text('Answer 3'), onPressed: _answerQuestion),
        ]),
      ),
    );
  }
}
