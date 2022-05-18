import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:geo_exam/Home.dart';
import 'package:geo_exam/User/UserLogin.dart';
import 'package:geolocator/geolocator.dart';

//Extra info geolocator:
//https://pub.dev/packages/geolocator
Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}


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
                textStyle: const TextStyle(
                    fontSize: 33.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold
                  ),
                onComplete: () {
                  debugPrint('Countdown Ended');
                },
              ))),
    );
  }
}
