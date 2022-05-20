import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geo_exam/Admin/ChangePassword.dart';
import 'package:geo_exam/Admin/Manage_students/StudentList.dart';
import 'QuestionSelection.dart';
import 'package:firebase_database/firebase_database.dart';

String _error = "";

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {

  final auth = FirebaseAuth.instance;

  late int _examDuration;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Admin Page'),
          backgroundColor: Colors.red[800],
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: TextButton(
                    onPressed: () {
                      auth.signOut();
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Log out',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                )),
          ]),
      body: Column(children: [
        const SizedBox(
          height: 300,
        ),
        Table(
          columnWidths: const <int, TableColumnWidth>{
            0: IntrinsicColumnWidth(),
            1: FlexColumnWidth(),
            2: FixedColumnWidth(300),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,

          children: <TableRow>[
            TableRow(
              children: <Widget>[
                Container(
                  height: 50,
                ),
                TableCell(
                  //TableCell voor Examen
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => QuestionSelection()));
                        },
                        child: const Text('Maak een examen'),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red[800],
                            minimumSize: const Size(0, 80),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ))),
                  )
                ),
                TableCell(
                  //TableCell voor Studenten
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => StudentList()));
                      },
                      child: const Text('Studenten'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red[800],
                        minimumSize: const Size(0, 80),
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ))),
                  ),
                ),
                TableCell(
                  //TableCell voor Wachtwoord wijzigen
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ChangePassword()));
                      },
                      child: const Text('Wachtwoord wijzigen'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red[800],
                        minimumSize: const Size(100, 80),
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ))),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 100,
        ),
        Flexible(child:
        Padding(
          padding: EdgeInsets.all(24),
          child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Voer de duur van het examen in (in minuten)',
              ),
              onChanged: (value) {
                setState(() {
                  _examDuration = int.parse(value)*60;
                  print(_examDuration);
                });
              }),
        ),
        ),
        Flexible(child:
        Padding(
          padding: EdgeInsets.all(24),
          child: ElevatedButton(
            onPressed: () async {
              FirebaseDatabase.instance.ref("ExamenTijd/Tijdsduur") //Set naar de juiste firebase "Tak" (variabele zodat het een nieuwe tak maakt)
                  .set({ //Maak het stuk JSON
                "TimeInSeconds": _examDuration
              })
                  .then((_) {_error = "Set exam duration to ${_examDuration/60} minutes";showErrorDialog(context);}) //Dialog voor success
                  .catchError((error) {_error = "An error occured! Please try again.";showErrorDialog(context);}); //Dialog voor error
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.red[800], // set the background color
              fixedSize: const Size(160,60),
            ),
            child: const Text('Examentijd instellen'),
          ),
        ),
        ),

      ]
      ),
    );
  }
}

showErrorDialog(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Something happened!"),
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