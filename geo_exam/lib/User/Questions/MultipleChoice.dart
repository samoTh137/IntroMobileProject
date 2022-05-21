import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

List<String> vragenlijst = ['', '', ''];
List<String> fouteAntwoorden = [];
String juistAntwoord = '';
List<String> items = ['', '', '', ''];
List<DropdownMenuItem<String>>? dropdownitems;
String questionString = 'Open vraag komt hier';
String huidigeVraag = '';
int index = 0;
int scoreInt = 0;
String _antwoord = '';
String _error = '';
bool gecontroleerd = false;

class MultipleChoice extends StatefulWidget {
  @override
  _MultipleChoiceState createState() => _MultipleChoiceState();
  final String? currentUser;
  const MultipleChoice({Key? key, required String? this.currentUser}) : super(key: key);
}

class _MultipleChoiceState extends State<MultipleChoice> {
  String? dropdownvalue;

  @override
  void initState() {
    super.initState();
    _loadFromDB(0);
  }

  @override
  Widget build(BuildContext context) {
    DatabaseReference antwoord = FirebaseDatabase.instance.ref('Vragen/MultipleChoice/Vraag$index/${widget.currentUser}/Antwoord');
    DatabaseReference ref = FirebaseDatabase.instance.ref('Vragen/MultipleChoice');
    ref.once().then((snapshot) {
      for (int i = 0; i < vragenlijst.length; i++) {
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
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: 300,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          hint: Text(
                            'Kies je antwoord',
                            style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).hintColor,),
                          ),
                          items: dropdownitems,
                          value: dropdownvalue,
                          onChanged: (value) {
                            setState(() {
                              _antwoord = value as String;
                            });
                          },
                          buttonHeight: 40,
                          buttonWidth: 140,
                          itemHeight: 40,
                        ),
                      ),
                    ),
                  ),
                ),
                Text('Je gekozen antwoord: '+_antwoord)
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        DatabaseReference controle = FirebaseDatabase.instance.ref('Vragen/MultipleChoice/Vraag$index/Correct Antwoord');

                        controle.once().then((snapshot) {
                          final String juistAntwoord = snapshot.snapshot.value.toString().replaceAll('[', '').replaceAll(']', '');
                          print(juistAntwoord);
                          DatabaseReference oudAntwoord = FirebaseDatabase.instance.ref('Vragen/MultipleChoice/Vraag$index/${widget.currentUser}/Antwoord');
                          oudAntwoord.once().then((snapshot) {
                            final String gegevenAntwoord = snapshot.snapshot.value.toString().replaceAll('[', '').replaceAll(']', '');
                            print(gegevenAntwoord);

                            if (juistAntwoord == gegevenAntwoord) {
                              DatabaseReference punten = FirebaseDatabase.instance.ref('Users/${widget.currentUser}/Score');
                              punten.once().then((snapshot) {
                                final score = int.parse(
                                    snapshot.snapshot.value.toString()
                                        .replaceAll('[', '')
                                        .replaceAll(']', ''));
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
                      _loadFromDB(index);
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


  void _loadFromDB(int getal) {
    DatabaseReference ref = FirebaseDatabase.instance.ref('Vragen/MultipleChoice/Vraag$getal');
    ref.get().then((snapshot) {
      String juist = snapshot
          .child("Correct Antwoord")
          .value
          .toString()
          .replaceAll('[', '')
          .replaceAll(']', '');
      String foutjes = snapshot
          .child("Foute Antwoorden")
          .value
          .toString();
      foutjes = foutjes.replaceAll('[', '').replaceAll(']', '');
      fouteAntwoorden = foutjes.split(',');
      fouteAntwoorden.forEach((element) {
        element.trim();
      });
      print(fouteAntwoorden);
      items = fouteAntwoorden;
      items.add(juist);
      print(items);
      _loadToDropdown();
    }
    );
  }

  void _loadToDropdown() {
    setState(() {
      dropdownitems = items
          .map((item) =>
          DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ))
          .toList();
    });
  }
}
