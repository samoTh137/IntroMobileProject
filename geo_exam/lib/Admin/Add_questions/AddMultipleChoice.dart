import 'package:flutter/material.dart';

class AddMultipleChoice extends StatefulWidget {
  @override
  _AddMultipleChoiceState createState() => _AddMultipleChoiceState();
}

class _AddMultipleChoiceState extends State<AddMultipleChoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Multiple Choice Vraag Toevoegen'),
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
              children: [
                Flexible(child:
                Padding(
                  padding: EdgeInsets.all(24),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Voer de vraag in...',
                    ),
                  ),
                ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(child:
                Padding(
                  padding: EdgeInsets.all(24),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Voer de antwoorden in gescheiden door ; ...',
                    ),
                  ),
                ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(child:
                Padding(
                  padding: EdgeInsets.all(24),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Voer het correcte antwoord in...',
                    ),
                  ),
                ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
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
              ],
            ),
          ],
        )
    );
  }
}
