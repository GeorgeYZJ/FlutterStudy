import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './question.dart';
import './answer.dart';

//void main() {
//  runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = const [
      {
        'questionText': 'What\'s your favourite color?',
        'answers': ['Balck', 'Red', 'Green', 'White'],
      },
      {
        'questionText': 'What\'s your favourite animal?',
        'answers': ['Rabbit', 'snake', 'Elephant', 'Lion'],
      },
      {
        'questionText': 'Who\'s  your favorite instructor?',
        'answers': ['Max', 'snake', 'Max', 'Lion'],
      },
    ];
  var _questionIndex = 0;
  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print('Anwser ${_questionIndex} chosen!');
    if (_questionIndex < questions.length) {
      print('We have more questions!');
    }
  }


  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
          ),
          body: Column(
            children: [
              Question(
                questions[_questionIndex]['questionText'],
              ),
              ...(questions[_questionIndex]['answers'] as List<String>) //a first level list
                  .map((answer) {
                return Answer(_answerQuestion, answer);
              }).toList()
            ],
          )),
    );
  }
}
