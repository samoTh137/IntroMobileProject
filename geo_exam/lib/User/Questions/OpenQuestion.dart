import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

String questionString = 'Open vraag komt hier';
String _antwoord = '';
String _error = '';

class OpenQuestion extends StatefulWidget {
  final String? currentUser;
  const OpenQuestion({Key? key, required String? this.currentUser}) : super(key: key);

  @override
  _OpenQuestionState createState() => _OpenQuestionState();
}

class _OpenQuestionState extends State<OpenQuestion> {
  @override
  Widget build(BuildContext context) {

    DatabaseReference questionRefOpen = FirebaseDatabase.instance.ref('Vragen/OpenVragen/Hoe heet deze app?/Vraag');
    questionRefOpen.onValue.listen((DatabaseEvent latEvent) {
      final dataOpen = latEvent.snapshot.value;
      setState(() {
        questionString = dataOpen.toString();
      });
      //print(questionString);
    });


    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Open Vraag'),
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
              children:[
                Text(
                  questionString,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Row(
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
              children: [
                Flexible(child :
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      FirebaseDatabase.instance.ref("Vragen/OpenVragen/$_vraag/$_user/Antwoord") //Set naar de juiste firebase "Tak" (variabele zodat het een nieuwe tak maakt)
                          .set({ //Maak het stuk JSON
                        " Antwoord": {_antwoord}
                      })
                          .then((_) {_error = "Successfully uploaded Question!";showErrorDialog(context);}) //Dialog voor success
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
            )
          ],

        )
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