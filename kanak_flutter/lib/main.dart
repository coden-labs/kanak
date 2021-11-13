import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Kanak',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Kanak'),
        ),
        body: Center(
          child: Text('Your finances taken care of'),
        ),
      ),
    );
  }
}
