import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

FirebaseDatabase database = FirebaseDatabase.instance;

String _codeToCorrect = "";
String _correctedCode = "";
String _error= "";
int nummer = 0;

class AddCodeCorrection extends StatefulWidget {
  const AddCodeCorrection({Key? key}) : super(key: key);

  @override
  _AddCodeCorrectionState createState() => _AddCodeCorrectionState();
}

class _AddCodeCorrectionState extends State<AddCodeCorrection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Code Correctie Vraag Toevoegen'),
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
                children:[

                  Flexible(child:
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Voer de te corrigeren code in',
                        ),
                        onChanged: (value) {
                          setState(() {
                            _codeToCorrect = value;
                          });
                        }),
                  ),
                  ),

                  Flexible(child:
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Voer de correcte code in',
                        ),
                        onChanged: (value) {
                          setState(() {
                            _correctedCode = value;
                          });
                        }),
                  ),
                  ),
                ]),

            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:[

                  Flexible(child :
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        _correctedCode.toString();
                        _codeToCorrect.toString();
                        FirebaseDatabase.instance.ref("Vragen/CodeCorrectieVragen/Vraag$nummer") //Set naar de juiste firebase "Tak" (variabele zodat het een nieuwe tak maakt)
                            .set({ //Maak het stuk JSON
                          "Code Te Corrigeren": _codeToCorrect,
                          "Gecorrigeerde Code": {_correctedCode}
                        })
                            .then((_) {_error = "Successfully uploaded Question!";showErrorDialog(context); nummer++;}) //Dialog voor success
                            .catchError((error) {_error = "An error occured! Please try again.";showErrorDialog(context);}); //Dialog voor error
                      },
                      child: const Text('Vraag toevoegen'),
                    ),
                  ),
                  ),
                ])

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

