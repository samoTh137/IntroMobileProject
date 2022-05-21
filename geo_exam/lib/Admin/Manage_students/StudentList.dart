import 'package:flutter/material.dart';
import 'package:geo_exam/Admin/Manage_students/Map.dart';
import 'package:firebase_database/firebase_database.dart';

class StudentList extends StatefulWidget {
  const StudentList({Key? key}) : super(key: key);

  @override
  _StudentList createState() => _StudentList();
}

List<String> students = ['', '', '', '', '', '', '', '', '', ''];
List<String> locations = ['', '', '', '', '', '', '', '', '', ''];
List<String> scores = ['', '', '', '', '', '', '', '', '', ''];

String text = "Hier komt een lijst van alle studenten";
String locatieText = "Hier komt een lijst van alle locaties";
String scoreText = "Hier komt een lijst van alle scores";

class _StudentList extends State<StudentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Studenten'),
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
        body: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(text,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
              ),

              Text(locatieText,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
              ),

              Text(scoreText,
              textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        DatabaseReference ref = FirebaseDatabase.instance.ref('Users');

                        ref.once().then((snapshot) {
                          for (int i = 0; i <= students.length; i++) {
                            String username = "User$i";
                            if (snapshot.snapshot.hasChild(username.toString())) {
                              students[i] = snapshot.snapshot.child("$username/Name").value.toString();
                              //print('check ' + username + ' | ' + students[i]); //Debugging  purposes
                            } else {
                              break;
                            }
                          }
                          setState(() {
                            text = '';
                            for (int x = 0; x < students.length; x++) {
                              if (students[x].isNotEmpty) {
                                text = text + students[x] + '\n';
                              }
                            }
                          });
                        });

                        ref.once().then((snapshot) {
                          for (int i = 0; i <= locations.length; i++) {
                            String username = "User$i";
                            if (snapshot.snapshot.hasChild(username.toString())) {
                              String locationUntrimmed = snapshot.snapshot.child("$username/Locatie").value.toString();
                              if(locationUntrimmed != "null")
                              {
                                locations[i] = locationUntrimmed.substring(1,locationUntrimmed.length-1);
                              }
                              else {locations[i] = locationUntrimmed;}
                              //print('check ' + username + ' | ' + locations[i]); //Debugging  purposes
                            } else {
                              break;
                            }
                          }
                          setState(() {
                            locatieText = '';
                            for (int x = 0; x < locations.length; x++) {
                              if (locations[x].isNotEmpty) {
                                locatieText = locatieText + locations[x] + '\n';
                              }
                            }
                          });
                        });

                        ref.once().then((snapshot) {
                          for (int i = 0; i <= scores.length; i++) {
                            String username = "User$i";
                            if (snapshot.snapshot.hasChild(username.toString())) {
                              scores[i] = snapshot.snapshot.child("$username/Score").value.toString();
                              //print('check ' + username + ' | ' + scores[i]); //Debugging  purposes
                            } else {
                              break;
                            }
                          }
                          setState(() {
                            scoreText = '';
                            for (int x = 0; x < scores.length; x++) {
                              if (scores[x].isNotEmpty) {
                                scoreText = scoreText + scores[x] + '\n';
                              }
                            }
                          });
                        });
                      },
                      child: const Text("Update"),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(100,40)
                      ),),
                  ElevatedButton(
                      onPressed: ()async {
                        DatabaseReference ref = FirebaseDatabase.instance.ref('Users');
                        ref.once().then((scoreRef){
                          for (int i = 0; i < students.length; i++) {
                            String username = "User$i";
                          if(scoreRef.snapshot.hasChild(username.toString())){
                            DatabaseReference score = FirebaseDatabase.instance.ref('Users/$username/Score');
                            score.set(0);
                          }
                          }
                        });

                        },
                      child: const Text('Reset'),//Reset
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100,40)
                  )
                  ),
                ],
              ),


              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => const Map()));
                  },
                  child: const Text('Kaart tonen'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red[800],
                      minimumSize: const Size(100, 80),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ))), //Map
            ],
          ),
        ]));
  }
}
