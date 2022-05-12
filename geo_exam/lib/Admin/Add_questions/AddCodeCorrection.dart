import 'package:flutter/material.dart';

class AddCodeCorrection extends StatefulWidget {
  const AddCodeCorrection({Key? key}) : super(key: key);

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
        body: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:[

                  Flexible(child:
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child :TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Voer de te corrigeren code in...',
                      ),
                    ),
                  ),
                  ),

                  Flexible(child:
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child :TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Voer de gecorrigeerde code in...',
                      ),
                    ),
                  ),
                  ),
                ]),

            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:[

                  Flexible(child :
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red[800], // set the background color
                        fixedSize: const Size(240,80),
                      ),
                      child: const Text('Vraag toevoegen'),
                    ),
                  ),
                  ),
                ])

          ],
        )
    );
  }
}

