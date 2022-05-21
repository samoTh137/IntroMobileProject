import 'package:flutter/material.dart';
import 'User/StartExam.dart';

class UserPage extends StatefulWidget {
  final String? user;
  UserPage({Key? key, required String? this.user}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('User'),
          backgroundColor: Colors.red[800],
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    }, child: const Text(
                    'Log out',
                    style:TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  ),
                )
            ),
          ]
      ),
      body:
          Center(
          child: StartExam(currentUser: widget.user,)
          )
    );
  }
}