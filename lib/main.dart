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
  var _questionIndex = 0;
  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print('Anwser chosen!');
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {'questionText':'What\'s your favourite color?', 
      'answers': ['Balck','Red','Green','White'],
      },
      {'questionText':'What\'s your favourite animal?', 
      'answers': ['Rabbit','snake','Elephant','Lion'],
      },
      {'questionText':'Who\'s  your favorite instructor?', 
      'answers': ['Max','snake','Max','Lion'],
      },
    ];
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
              ...(questions[_questionIndex]['answers']as List<String>).map((answer){
                return Answer(_answerQuestion, answer);
              }).toList()
            ],
          )),
    );
  }
}
