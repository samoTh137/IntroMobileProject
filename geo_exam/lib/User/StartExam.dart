import 'package:flutter/material.dart';
import 'package:geo_exam/User/Exam.dart';

class StartExam extends StatefulWidget {
  const StartExam({Key? key}) : super(key: key);

  @override
  State<StartExam> createState() => _StartExamState();
}

class _StartExamState extends State<StartExam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        /*child: Text('This will be the page for Users',
          style:TextStyle(fontSize: 30),),*/
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(
                    builder: (_) => ExamQuestions()));
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.red[800],
            minimumSize: const Size(55,60),
          ),
          icon: Icon(Icons.play_arrow_outlined, size: 30),
          label: Text(
            "START EXAM",
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
