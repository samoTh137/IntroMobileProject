import 'package:flutter/material.dart';
import 'package:geo_exam/User/Exam.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';
//Extra info geolocator:
//https://pub.dev/packages/geolocator
FirebaseDatabase database = FirebaseDatabase.instance;

String _error= "";


class StartExam extends StatefulWidget {
  final String? currentUser;
  const StartExam({Key? key, required String? this.currentUser}) : super(key: key);

  @override
  State<StartExam> createState() => _StartExam();
}

class _StartExam extends State<StartExam> {
  Position _currentPosition = Position(longitude: 0, latitude: 0, timestamp: DateTime(0000) , accuracy: 0, altitude: 0, heading: 0, speed: 0, speedAccuracy: 0);

  @override
  void initState() {
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center ,
            children:[

              ElevatedButton.icon(

                onPressed: () async {
                  //locatie verkrijgen en naar database sturen TODO: _currentPosition naar database sturen
                  _sendToFirebase();

                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (_) => const ExamQuestions()));
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red[800],
                  minimumSize: const Size(55,60),
                ),
                icon: const Icon(Icons.play_arrow_outlined, size: 30),
                label: const Text(
                  "START EXAM",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ],
          ),
    ),
        ],
      ),
    );
  }

  _sendToFirebase() {
    _getCurrentLocation();
    FirebaseDatabase.instance.ref("Users/${widget.currentUser}/Locatie")
        .set({
      "Lat": {_currentPosition.latitude},
      "Long": {_currentPosition.longitude}
    });
        //.then((_) {_error = "Successfully uploaded Location!";showErrorDialog(context);}); //Dialog voor success
    //.catchError((error) {_error = "An error occured! Please try again.";showErrorDialog(context);});
  }

  _getCurrentLocation() {
    Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
    print(_currentPosition);
  }
}

showErrorDialog(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Something happened!"),
    content: Text(_error),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
