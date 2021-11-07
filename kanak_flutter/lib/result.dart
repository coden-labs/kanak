import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = "This is just meh!";

    if (resultScore < 0) {
      resultText = "You like unicorns a bit too much, no cookie for you!";
    } else if (resultScore <= 10) {
      resultText = "You are okay I guess, not to great, not too bad";
    } else if (resultScore <= 20) {
      resultText =
          "You are on your way to greatness, improvise, adapt and overcome";
    } else {
      resultText = "You are awesome, and everyone aspires to be you";
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Container(
          child: Column(
            children: [
              Text(
                "Thank you for answering all questions",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                "Your score is $resultScore",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                resultPhrase,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
            ],
            mainAxisSize: MainAxisSize.min,
          ),
          margin: EdgeInsets.all(20),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
          child: Text("Reset Quiz"),
          onPressed: resetHandler,
        )
      ],
      mainAxisSize: MainAxisSize.min,
    ));
  }
}
