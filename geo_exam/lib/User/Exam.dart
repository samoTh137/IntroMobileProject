import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:geo_exam/Home.dart';
import 'package:geo_exam/User/Questions/OpenQuestion.dart';
import 'package:geo_exam/User/UserLogin.dart';
import 'package:firebase_database/firebase_database.dart';

class ExamQuestions extends StatefulWidget {
  const ExamQuestions({Key? key}) : super(key: key);

  @override
  State<ExamQuestions> createState() => _ExamQuestionsState();
}

class _ExamQuestionsState extends State<ExamQuestions> with WidgetsBindingObserver {

  late int examDurationInt;
  int appInBackgroundCounter = 0;
  DatabaseReference examTimeRef = FirebaseDatabase.instance.ref('ExamenTijd/Tijdsduur/TimeInSeconds/');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  int getData() {
    examTimeRef.onValue.listen((DatabaseEvent durationEvent) {
      final int data = int.parse(durationEvent.snapshot.value.toString());
      setState(() {
        examDurationInt = data;
      });
    });
    print(examDurationInt);
    return(examDurationInt);
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

    CountDownController _controller = CountDownController();

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
          const SizedBox(
            height: 300,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:[
          // child: Text('Exam Questions',
          //style:TextStyle(fontSize: 30),
          //),

             /* margin: EdgeInsets.all(24),
              padding: EdgeInsets.only(top: 24),
              alignment: Alignment.topLeft,*/
        CircularCountDownTimer(
                //https://pub.dev/packages/circular_countdown_timer
                controller: _controller,
                isReverse: true,
                initialDuration: 0,
                duration: getData(),
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
