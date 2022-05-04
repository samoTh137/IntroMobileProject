import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Admin Page'),
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
      body: Center(
        child: ElevatedButton(
        onPressed: () { //TODO ADD REDIRECTION TO EXAM MAKING PAGE HERE
          //Navigator.push(
          //context, MaterialPageRoute(builder: (_) => ExamMakerPage()));
        ;},
        child: const Text('Maak een examen'),
        style: ElevatedButton.styleFrom(
          primary: Colors.red[800],
          minimumSize: Size(0, 80),
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
      ),
    ))));
  }
}