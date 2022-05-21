import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

List<String> vragenlijst = ['', '', '', '', ''];
String questionString = 'Open vraag komt hier';
String huidigeVraag = '';
int index = 0;
int scoreInt = 0;
String _antwoord = '';
String _error = '';
bool gecontroleerd = false;

class OpenQuestion extends StatefulWidget {
  final String? currentUser;
  const OpenQuestion({Key? key, required String? this.currentUser})
      : super(key: key);

  @override
  _OpenQuestionState createState() => _OpenQuestionState();
}

class _OpenQuestionState extends State<OpenQuestion> {
  @override
  Widget build(BuildContext context) {
    DatabaseReference ref = FirebaseDatabase.instance.ref('Vragen/OpenVragen');

    ref.once().then((snapshot) {
      for (int i = 0; i <= vragenlijst.length; i++) {
        String questionName = "Vraag$i";
        if (snapshot.snapshot.hasChild(questionName.toString())) {
          vragenlijst[i] =
              snapshot.snapshot
                  .child("$questionName/Vraag")
                  .value
                  .toString();
        } else {
          break;
        }
      }
      setState(() {
        questionString = '';
        for (int x = 0; x < vragenlijst.length; x++) {
          if (vragenlijst[x].isNotEmpty) {
            questionString = vragenlijst[x];
          }
        }
      });
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
              children: [
                Text(
                  vragenlijst[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Padding(
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
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        DatabaseReference antwoord = FirebaseDatabase.instance.ref('Vragen/OpenVragen/Vraag$index/${widget.currentUser}/Antwoord');
                        DatabaseReference controle = FirebaseDatabase.instance.ref('Vragen/OpenVragen/Vraag$index/Correct Antwoord');

                        controle.once().then((snapshot){
                          final String juistAntwoord = snapshot.snapshot.value.toString().replaceAll('[', '').replaceAll(']', '');
                          print(juistAntwoord);
                          DatabaseReference oudAntwoord = FirebaseDatabase.instance.ref('Vragen/OpenVragen/Vraag$index/${widget.currentUser}/Antwoord');
                          oudAntwoord.once().then((snapshot) {
                            final String gegevenAntwoord = snapshot.snapshot.value.toString().replaceAll('[', '').replaceAll(']', '');
                            print(gegevenAntwoord);

                            if (juistAntwoord == gegevenAntwoord) {
                              DatabaseReference punten = FirebaseDatabase.instance.ref('Users/${widget.currentUser}/Score');
                              punten.once().then((snapshot) {
                                final score = int.parse(snapshot.snapshot.value.toString().replaceAll('[', '').replaceAll(']', ''));
                                print(score);
                                setState(() {
                                  scoreInt = score;
                                  scoreInt++;
                                  print(scoreInt);
                                  punten.set({scoreInt});
                                });
                              });
                            }
                          });
                        });
                        antwoord.set(_antwoord);
                        _antwoord = '';
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red[800], // set the background color
                        fixedSize: const Size(240, 80),
                      ),
                      child: const Text('Antwoord Opslaan'),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      _nextQuestion();
                      setState(() {
                        _antwoord = ''; //Invulvak leegmaken
                      });
                    },
                    child: Text('Volgende Vraag')),
              ],
            )
          ],
        ));
  }


  void _nextQuestion() {
    if (index < vragenlijst.length - 1) {
      index++;
    } else {
      index = 0;
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
}