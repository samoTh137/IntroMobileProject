import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePassword createState() => _ChangePassword();
}

String _error = '';
String _email = '';
String _password = '';
String _newPassword = '';

class _ChangePassword extends State<ChangePassword> {

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Wachtwoord Wijzigen'),
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
                    child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'E-mail...',
                            hintText: 'Voer uw e-mail adres in'),
                        onChanged: (value) {
                          setState(() {
                            _email = value.trim();
                          });
                        }
                    ),
                  ),
                  ),
                ]),

            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:[

                  Flexible(child:
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Huidig wachtwoord...',
                            hintText: 'Voer uw huidig wachtwoord in'),
                        onChanged: (value) {
                          setState(() {
                            _password = value.trim();
                          });
                        }
                    ),
                  ),
                  ),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:[

                  Flexible(child:
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Nieuw wachtwoord...',
                            hintText: 'Voer een nieuw sterk wachtwoord in'),
                        onChanged: (value) {
                          setState(() {
                            _newPassword = value.trim();
                          });
                        }
                    ),
                  ),
                  ),
                ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.red[800], borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () async {
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: _email,
                            password: _password

                        );
                        if (await FirebaseAuth.instance.currentUser != null) {
                          // check nieuw wachtwoord
                          // voer wijziging door

                        }
                      }
                      on FirebaseAuthException catch (e) {
                        if (!_email.contains('@')) {
                          _error = e.toString();
                          showAlertDialog(context);
                        } else if (e != null ){
                          _error = e.toString();
                          showAlertDialog(context);
                        }
                      }
                    },
                    child: const Text(
                      'Wijzigen',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),),
                ),
              ],
            ),
          ],
        )
    );
  }
}

showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Error Occured"),
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
