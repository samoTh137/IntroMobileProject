import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:geo_exam/Home.dart';
import 'package:geo_exam/User/Questions/OpenQuestion.dart';
import 'package:geo_exam/User/UserLogin.dart';

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
                        Navigator.push(context,
                        MaterialPageRoute(
                      builder: (_) => const MainHome()));
                    },
                    child: const Text(
                      'Log out',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                )),
          ]),
      body: Column(
        children: [
          Row(
      children:[
          // child: Text('Exam Questions',
          //style:TextStyle(fontSize: 30),
          //),

             /* margin: EdgeInsets.all(24),
              padding: EdgeInsets.only(top: 24),
              alignment: Alignment.topLeft,*/
        CircularCountDownTimer(
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
                textStyle: const TextStyle(
                    fontSize: 33.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold
                  ),
                onComplete: () {
                  debugPrint('Countdown Ended');
                },
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => OpenQuestion()));
            },
            child: const Text('Open vraag'),
            style: ElevatedButton.styleFrom(
                primary: Colors.red[800],
                minimumSize: const Size(100, 80),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ))),
      ])]),
    );
  }
}
