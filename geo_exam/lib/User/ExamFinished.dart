import 'package:flutter/material.dart';
import 'package:geo_exam/Home.dart';

class ExamFinished extends StatefulWidget {
  const ExamFinished({Key? key}) : super(key: key);

  @override
  _ExamFinishedState createState() => _ExamFinishedState();
}

class _ExamFinishedState extends State<ExamFinished> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Questions'),
            backgroundColor: Colors.red[800],
            actions: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (_) => const MainHome()));
                      },
                      child: const Text(
                        'Log out',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  )),
            ]),
        body: Center(
          child: Text("Het examen is afgerond"),
        )
    );
  }
}