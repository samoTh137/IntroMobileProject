import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class ExamQuestions extends StatefulWidget {
  const ExamQuestions({Key? key}) : super(key: key);

  @override
  State<ExamQuestions> createState() => _ExamQuestionsState();
}



class _ExamQuestionsState extends State<ExamQuestions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Questions'),
          backgroundColor: Colors.red[800],
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Back',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                )),
          ]),
        body: Center(
         // child: Text('Exam Questions',
          //style:TextStyle(fontSize: 30),
        //),
          child: Container(
              margin: EdgeInsets.all(24),
              padding: EdgeInsets.only(top: 24),
              alignment: Alignment.topLeft,

              child: CircularCountDownTimer(
                //https://pub.dev/packages/circular_countdown_timer
                duration: 3600,
                fillColor: Colors.purpleAccent,
                fillGradient: null,
                ringColor: Colors.grey,

                height: 100,
                width: 100,

                onComplete: () {
                  debugPrint('Countdown Ended');
                },

              )
          )




    ),
    );
  }
}
