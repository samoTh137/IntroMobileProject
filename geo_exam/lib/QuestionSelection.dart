import 'package:flutter/material.dart';

class QuestionSelection extends StatefulWidget {
  @override
  _QuestionSelectionState createState() => _QuestionSelectionState();
}

class _QuestionSelectionState extends State<QuestionSelection> {
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
                    'Back',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  ),
                )
            ),
          ]
      ),
      body: Center(
        child: Table(
          //border: TableBorder.all(),
          columnWidths: const <int, TableColumnWidth>{
            0: IntrinsicColumnWidth(),
            1: FlexColumnWidth(),
            2: FixedColumnWidth(64),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: <TableRow>[
            TableRow(
              children: <Widget>[
                Container(
                  height: 128,
                    child: TextButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // Background color
                      ),
                      child: const Text('Multiple Choice', style: TextStyle(fontSize: 20.0),),
                      onPressed: () {Navigator.push(
                          context, MaterialPageRoute(builder: (_) => QuestionSelection()));
                        //TODO Change page name
                      ;},

                    )
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                    height: 128,
                    width: 32,
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: 128,
                    child: TextButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // Background color
                      ),
                      child: const Text('Code Correctie', style: TextStyle(fontSize: 20.0),),
                      onPressed: () {Navigator.push(
                          context, MaterialPageRoute(builder: (_) => QuestionSelection()));
                      //TODO Change page name
                          ;},

                    )
                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                Container(
                  height: 128,
                    child: TextButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // Background color
                      ),
                      child: const Text('Open Vraag', style: TextStyle(fontSize: 20.0),),
                      onPressed: () {Navigator.push(
                          context, MaterialPageRoute(builder: (_) => QuestionSelection()));
                      //TODO Change page name
                          ;},

                    )
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                    height: 128,
                    width: 32,
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: 128,
                    child: TextButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // Background color
                      ),
                      child: const Text('Alle Vragen', style: TextStyle(fontSize: 20.0),),
                      onPressed: () {Navigator.push(
                          context, MaterialPageRoute(builder: (_) => QuestionSelection()));
                      //TODO Change page name
                          ;},

                    )
                ),
              ],
            ),
          ],
        )
      )
    );
  }
}