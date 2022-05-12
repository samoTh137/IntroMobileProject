// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:geo_exam/AdminPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AdminLoginTab extends StatefulWidget {
  const AdminLoginTab({Key? key}) : super(key: key);

  @override
  State<AdminLoginTab> createState() => _AdminLoginTabState();
}

String _error = '';
String _email = '';
String _password = '';

class _AdminLoginTabState extends State<AdminLoginTab> {

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[650],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0, bottom: 10.0),
              child: Center(
                child: SizedBox(
                    width: 400,
                    height: 200,
                    child: Image.asset('asset/images/ApLogoColor.png')),
              ),
            ),
            //Email field
             Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
                onChanged: (value) {
                  setState(() {
                    _email = value.trim();
                  });
                }
              ),
            ),
            //Password field
             Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
                  onChanged: (value) {
                    setState(() {
                      _password = value.trim();
                    });
                  }
              ),
            ),
            //Forgot password
            TextButton(
              onPressed: (){
                //TODO FORGOT PASSWORD SCREEN GOES HERE
                //print('Forgot password button pressed');
              },
              child: const Text(
                'Forgot Password',
                style: TextStyle(color: Colors.redAccent, fontSize: 15),
              ),
            ),
            //Login button
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => AdminPage()));
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
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),),
            ),
            const SizedBox(
              height: 50,
            ),
            //Create account
             TextButton(
              child: const Text('New user? Create your account.'),
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: _email,
                    password: _password,
                  );
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    _error = e.toString();
                    showAlertDialog(context);
                  } else if (e.code == 'email-already-in-use') {
                    _error = e.toString();
                    showAlertDialog(context);
                  }
                }           }
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
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