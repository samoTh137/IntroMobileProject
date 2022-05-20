import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class OpenQuestion extends StatefulWidget {
  @override
  _OpenQuestionState createState() => _OpenQuestionState();
}

class _OpenQuestionState extends State<OpenQuestion> {
  @override
  Widget build(BuildContext context) {

    String questionString = 'Open vraag komt hier';

    DatabaseReference questionRefOpen = FirebaseDatabase.instance.ref('Vragen/OpenVragen/Hoe heet deze app?/Vraag');
    questionRefOpen.onValue.listen((DatabaseEvent latEvent) {
      final dataOpen = latEvent.snapshot.value;
      questionString = dataOpen.toString();
      print(questionString);
    });


    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Open Vraag'),
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
        body: Center(
            child: Text(
              questionString,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
        )
    );
  }
}
