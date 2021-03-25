import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = [
    {
      "question": "What is your favourite color?",
      "answers": [
        {"text": "Black", "score": 5},
        {"text": "Red", "score": 10},
        {"text": "Green", "score": 15},
        {"text": "White", "score": 20}
      ],
    },
    {
      "question": "What is your favourite animal?",
      "answers": [
        {"text": "Rabbit", "score": 5},
        {"text": "Snake", "score": 10},
        {"text": "Cat", "score": 15},
        {"text": "Dog", "score": 20}
      ],
    },
    {
      "question": "Who is your favourite actor??",
      "answers": [
        {"text": "Johny Depp", "score": 5},
        {"text": "Leonardo Di Caprio", "score": 10},
        {"text": "Tom Hanks", "score": 15},
        {"text": "Tom Cruise", "score": 20}
      ],
    }
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
  }

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestions: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, resetQuiz),
      ),
    );
  }
}
