import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  void answerQuestion() {
    print('Answer chosen!');
  }

  @override
  Widget build(BuildContext context) {
    var questions = ['Question 1', 'Question 2'];

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My first app'),
          ),
          body: Column(children: [
            Text(questions[0]),
            RaisedButton(
              child: Text('Answer 1'),
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: Text('Answer 2'),
              onPressed: () => print('Arrow function answer!'),
            ),
            RaisedButton(
              child: Text('Answer 3'),
              onPressed: () {
                print('cool func answer chosen!');
              },
            ),
          ])),
    );
  }
}
