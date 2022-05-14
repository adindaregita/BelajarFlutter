import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': 'Siapa kah nama panjang nenek keluarga Hasan Galung?',
      'answers': [
        'Mak Tua',
        'Maimunah',
        'Mak Tua tapi masih muda',
        'Mama Muda'
      ],
    },
    {
      'questionText': 'Siapakah yang paling lucu di keluarga Hasan Galung?',
      'answers': ['Om Denan', 'Om Incut', 'Tante Mari', 'Tante Illing']
    },
    {
      'questionText': 'Siapa anak keluarga Hasan Galung yang paling bergaya?',
      'answers': ['Tante Illing', 'Om Ican', 'Tante Uu', 'Om Muksen']
    },
  ];

  var _questionIndex = 0;

  void _answerQuestion() {
    // var aBool = true;
    // aBool = false;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz Keluarga HG Berhadiah'),
        ),
        body: _questionIndex < questions.length
            ? Column(
                children: [
                  Question(questions[_questionIndex]['questionText']),
                  ...(questions[_questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList()
                ],
              )
            : Center(
                child: Text('You did it!'),
              ),
      ),
    );
  }
}
