import 'package:flutter/material.dart';

class ExamQuestions extends StatefulWidget {
  const ExamQuestions({Key? key}) : super(key: key);

  @override
  State<ExamQuestions> createState() => _ExamQuestionsState();
}

class _ExamQuestionsState extends State<ExamQuestions> {
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
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Back',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                )),
          ]),
        body: const Center(
          child: Text('Exam Questions',
            style:TextStyle(fontSize: 30),
            //TODO qe
          ),
        ),
    );
  }
}
