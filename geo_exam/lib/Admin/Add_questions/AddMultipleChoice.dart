import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

FirebaseDatabase database = FirebaseDatabase.instance;

String _vraag = "";
int nummer = 0;
String _juistantwoord = "";
List<String> _fouteantwoorden = [];
String _foutantwoord = "";
String _error= "";

class AddMultipleChoice extends StatefulWidget {
  @override
  _AddMultipleChoiceState createState() => _AddMultipleChoiceState();
}

class _AddMultipleChoiceState extends State<AddMultipleChoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Multiple Choice Vraag Toevoegen'),
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
                Flexible(
                  child: Padding(
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
                Flexible(
                  child: Padding(
                      padding: EdgeInsets.all(24),
                      child: TextButton.icon(
                        onPressed: () {
                          _displayDialog();
                        },
                        icon: Icon(Icons.add, size: 18),
                        label: Text("Voeg een fout antwoord toe (in totaal 4 antwoorden)"),
                      )),
                ),
                Text(_fouteantwoorden.toString()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Voer het correcte antwoord in',
                        ),
                        onChanged: (value) {
                          setState(() {
                            _juistantwoord = value;
                          });
                        }),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        _foutantwoord = _fouteantwoorden.toString(); //Naar string om variabele in de JSON te plaatsen
                        FirebaseDatabase.instance.ref("Vragen/MultipleChoice/Vraag$nummer") //Set naar de juiste firebase "Tak" (variabele zodat het een nieuwe tak maakt)
                          .set({ //Maak het stuk JSON
                            "Vraag": _vraag,
                            "Correct Antwoord": {_juistantwoord},
                            "Foute Antwoorden": {_foutantwoord}
                          })
                        .then((_) {_error = "Successfully uploaded Question!";showErrorDialog(context);nummer++;}) //Dialog voor success
                        .catchError((error) {_error = "An error occured! Please try again.";showErrorDialog(context);}); //Dialog voor error
                        _fouteantwoorden.clear(); //Clear zodat de lijst van foute antwoorden leeg is
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red[800],
                        fixedSize: const Size(240, 80),
                      ),
                      child: const Text('Vraag toevoegen'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  final TextEditingController _textFieldController = TextEditingController();

  Future<void> _displayDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a new answer'),
          content: TextField(
            controller: _textFieldController,
            decoration: const InputDecoration(hintText: 'Type a wrong answer'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                Navigator.of(context).pop();
                _addWrongAnswer(_textFieldController.text);
              },
            ),
          ],
        );
      },
    );
  }

  void _addWrongAnswer(String name) {
    setState(() {
      _fouteantwoorden.add(_textFieldController.text);
    });
    _textFieldController.clear();
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
