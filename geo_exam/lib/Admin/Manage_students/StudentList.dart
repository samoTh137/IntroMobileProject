import 'package:flutter/material.dart';
import 'package:geo_exam/Admin/Manage_students/Map.dart';
import 'package:firebase_database/firebase_database.dart';

class StudentList extends StatefulWidget {
  @override
  _StudentList createState() => _StudentList();
}

List<String> Students = ['', '', '', '', '', '', '', '', '', ''];
String text = 'Hier komt een lijst van alle studenten\n';

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
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                  onPressed: () {
                    DatabaseReference ref = FirebaseDatabase.instance.ref('Users');

                    ref.once().then((snapshot) {
                      for (int i = 0; i <= Students.length; i++) {
                        String username = "User$i";
                        if (snapshot.snapshot.hasChild(username.toString())) {
                          Students[i] = snapshot.snapshot.child("$username/Name").value.toString();
                          print('check ' + username + ' | ' + Students[i]); //Debugging  purposes
                        } else {
                          break;
                        }
                      }
                      setState(() {
                        text = '';
                        for (int x = 0; x < Students.length; x++) {
                          if (Students[x].isNotEmpty) {
                            text = text + Students[x] + '\n';
                          }
                        }
                      });
                    });
                  },
                  child: const Text("Update")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Map()));
                  },
                  child: const Text('Kaart tonen'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red[800],
                      minimumSize: const Size(100, 80),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ))),
            ],
          ),
        ]));
  }
}
