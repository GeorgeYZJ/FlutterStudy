import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BasicAppbar();
}

class _BasicAppbar extends State<MyApp> {
  final _questions = const [
    'What\'s your favourite color?',
    'What\'s your favourite animal?',
    'Who\'s  your favorite instructor?',
  ];
  int _textIndex = 0;
  void changeText() {
    setState(() {
      _textIndex += 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _textIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(left: 12),
          child: IconButton(
            icon: Icon(Icons.sync),
            onPressed: _resetQuiz,
          ),
        ),
        title:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text(
            'St Catherine\'s College',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ]),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('Click search');
            },
          ),
          IconButton(
            icon: Icon(Icons.star),
            onPressed: changeText,
          ),
        ],
      ),
      body: _textIndex < _questions.length
          ? Container(
              width: double.infinity,
              margin: EdgeInsets.all(20.0),
              child: Column(children: <Widget>[
                Text(
                  _questions[_textIndex],
                  style: TextStyle(fontSize: 28),
                  textAlign: TextAlign.center,
                ),
                RaisedButton(
                  child: Text('Change the content!'),
                  onPressed: changeText,
                )
              ]))
          : Container(
              width: double.infinity,
              margin: EdgeInsets.all(0),
              decoration: BoxDecoration(color: Colors.yellowAccent),
              child: Text(
                'No more text!',
                style: TextStyle(fontSize: 28),
              ),
            ),
    ));
  }
}
