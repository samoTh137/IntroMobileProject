import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

FirebaseDatabase database = FirebaseDatabase.instance;

String _vraag = "";
int nummer = 0;
String _antwoord = "";
String _error= "";

class AddOpenQuestion extends StatefulWidget {
  @override
  _AddOpenQuestionState createState() => _AddOpenQuestionState();
}

class _AddOpenQuestionState extends State<AddOpenQuestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Open Vraag Toevoegen'),
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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(child:
                  Padding(
                    padding: EdgeInsets.all(24),
                    child: TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Voer de vraag in',
                        ),
                        onChanged: (value) {
                          setState(() {
                            _vraag = value;
                          });
                        }),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(child:
                Padding(
                  padding: EdgeInsets.all(24),
                  child: TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Voer het antwoord in',
                      ),
                      onChanged: (value) {
                        setState(() {
                          _antwoord = value;
                        });
                      }),
                ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                 Flexible(child :
                    Padding(
                    padding: const EdgeInsets.all(24.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          print('Vraag' + nummer.toString());
                          FirebaseDatabase.instance.ref("Vragen/OpenVragen/Vraag${nummer.toString()}") //Set naar de juiste firebase "Tak" (variabele zodat het een nieuwe tak maakt)
                              .set({ //Maak het stuk JSON
                            "Vraag": _vraag,
                            "Correct Antwoord": {_antwoord}
                          })
                              .then((_) {_error = "Successfully uploaded Question!";showErrorDialog(context); nummer++;}) //Dialog voor success
                              .catchError((error) {_error = "An error occured! Please try again.";showErrorDialog(context);}); //Dialog voor error
                        },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red[800], // set the background color
                        fixedSize: const Size(240,80),
                      ),
                      child: const Text('Vraag toevoegen'),
                    ),
                 ),
                ),
              ],
            ),
          ],
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