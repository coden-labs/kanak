import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  Answer(this.answerText, this.selectHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: ElevatedButton(
         style: ButtonStyle(
           backgroundColor: MaterialStateProperty.all(Colors.blue),
           foregroundColor: MaterialStateProperty.all(Colors.white),
         ),
         child: Text(answerText),
         onPressed: selectHandler,
      )
    );
  }

}