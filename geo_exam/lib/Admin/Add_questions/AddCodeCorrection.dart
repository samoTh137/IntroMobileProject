import 'package:flutter/material.dart';

class AddCodeCorrection extends StatefulWidget {
  @override
  _AddCodeCorrectionState createState() => _AddCodeCorrectionState();
}

class _AddCodeCorrectionState extends State<AddCodeCorrection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Code Correctie Vraag Toevoegen'),
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
              'Hier komt een code correctie vraag.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
        )
    );
  }
}
