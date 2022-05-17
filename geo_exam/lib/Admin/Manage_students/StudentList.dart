import 'package:flutter/material.dart';

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
        body: Center(
            child: Text(
              'Hier komt een lijst van alle studenten.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
        )
    );
  }
}
