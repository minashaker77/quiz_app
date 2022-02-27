import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      home: QuizApp(),
    );
  }
}

Brain bri = Brain();

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Icon> icons = [];

  void checkAnswer(bool userPicked) {
    bool correct = bri.correctAnswer();
    setState(() {
      if (Brain.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();
        Brain.reset();
        icons = [];
      } else if (correct == userPicked) {
        icons.add(Icon(
          Icons.check_box,
          color: Colors.green.shade900,
        ));
      } else {
        icons.add(Icon(
          Icons.clear,
          color: Colors.red,
        ));
      }
      bri.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green.shade100,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  bri.getQuestionText(),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 30, color: Colors.green.shade900),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  checkAnswer(true);
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.green.shade700,
                  ),
                  child: Center(
                      child: Text(
                    'بله',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  )),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  checkAnswer(false);
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.red.shade700,
                  ),
                  child: Center(
                      child: Text(
                    'خیر',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  )),
                ),
              ),
            ),
            Row(
              children: icons,
            )
          ],
        ),
      ),
    );
  }
}
