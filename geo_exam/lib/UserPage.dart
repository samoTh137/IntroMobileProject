import 'package:flutter/material.dart';
import 'package:geo_exam/AdminPage.dart';
import 'User/StartExam.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

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
                    'Logout',
                    style:TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  ),
                )
            ),
          ]
      ),
      body:
        StartExam(),
    );
  }
}