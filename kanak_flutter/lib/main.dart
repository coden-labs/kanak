import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Kanak',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Kanak'),

        ),
        body: Container(
          child:
            Center(
              child: Text('Your finances taken care of'),
            ),
        ),
      ),
    );
  }
}
