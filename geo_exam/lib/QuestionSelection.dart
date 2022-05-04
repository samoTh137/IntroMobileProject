import 'package:flutter/material.dart';

class QuestionSelection extends StatefulWidget {
  const QuestionSelection({Key? key}) : super(key: key);

  @override
   _QuestionSelectionState createState() => _QuestionSelectionState();
}

class  _QuestionSelectionState extends State <QuestionSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('QuestionSelection'),
          backgroundColor: Colors.red[800],
          actions: <Widget>[]
      ),
    );
  }
}