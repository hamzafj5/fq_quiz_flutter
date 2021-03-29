import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'When was she born?',
      'answers': [
        {'text': '5th Nov', 'score': 10},
        {'text': '23rd Sept', 'score': 5},
        {'text': '17th Oct', 'score': 3},
        {'text': '29th Aug', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s her favorite color?',
      'answers': [
        {'text': 'Nude Pink/Blue/Maroon', 'score': 11},
        {'text': 'Red/Black/Purple', 'score': 9},
        {'text': 'Orange/Yellow/Brown', 'score': 3},
        {'text': 'White', 'score': 5},
      ],
    },
    {
      'questionText': 'What\'s her favorite food?',
      'answers': [
        {'text': 'Desi', 'score': 2},
        {'text': 'Fast Food', 'score': 9},
        {'text': 'Fine Dining', 'score': 10},
        {'text': 'All of Above', 'score': 5},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false;

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions broooooooooo');
    } else {
      print('No more questions brooooooooooo');
    }
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('FQ Quiz App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
