import 'package:flutter/material.dart';
import 'package:geo_exam/Admin/Manage_students/Map.dart';

class StudentList extends StatefulWidget {
  @override
  _StudentList createState() => _StudentList();
}

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
        body: Column(
            children:[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:[
                  Text(
                    'Hier komt een lijst van alle studenten.',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),

                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => Map()));
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

            ]

        )
    );
  }
}
