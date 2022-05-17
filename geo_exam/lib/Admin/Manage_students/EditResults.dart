import 'package:flutter/material.dart';

class EditResults extends StatefulWidget {
  const EditResults({Key? key}) : super(key: key);

  @override
  _EditResults createState() => _EditResults();
}

class _EditResults extends State<EditResults> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Resultaat Wijzigen'),
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
                  labelText: 'Here comes current result',
                ),
              ),
            ),
            ),
          ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(child :
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: ElevatedButton(
                    onPressed: () {}, //gewijzigd esultaat naar database sturen
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red[800], // set the background color
                      fixedSize: const Size(240,80),
                    ),
                    child: const Text('Resultaat opslaan'),
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
