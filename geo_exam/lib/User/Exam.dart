import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class ExamQuestions extends StatefulWidget {
  const ExamQuestions({Key? key}) : super(key: key);

  @override
  State<ExamQuestions> createState() => _ExamQuestionsState();
}

class _ExamQuestionsState extends State<ExamQuestions> with WidgetsBindingObserver {
  int appInBackgroundCounter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance?.addObserver(this);

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeAppLifecycleSate(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    final isBackground = state == AppLifecycleState.paused;
    if(isBackground == true)
      {
        appInBackgroundCounter++;
      }
  }

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
                controller: CountDownController(),
                isReverse: true,
                initialDuration: 0,
                duration: 600,
                fillColor: (Colors.red[300])!,
                fillGradient: null,
                ringColor: Colors.grey,

                height: 100,
                width: 100,

                onComplete: () {
                  debugPrint('Countdown Ended');
                },
              ))),
    );
  }
}
