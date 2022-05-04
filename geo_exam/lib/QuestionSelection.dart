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
                      },
                      child: const Text(
                        'Back',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  )),
            ]),
        body: Center(
            child: Table(
          //border: TableBorder.all(),
          columnWidths: const <int, TableColumnWidth>{
            0: IntrinsicColumnWidth(),
            1: FlexColumnWidth(),
            2: FixedColumnWidth(300),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: <TableRow>[
            TableRow(
              children: <Widget>[
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(50,50,50,50),
                child:   TextButton(
                style: ElevatedButton.styleFrom(
                primary: Colors.red[800], // Background color
                    minimumSize: const Size(400, 228)

                ),
                child: const Text(
                'Multiple Choice',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                builder: (_) => QuestionSelection()));
                //TODO Change page name
                    ;
                },
                )
        )

                   ),
                TableCell(

                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(50,50,50,50),
                        child:   TextButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red[800], // Background color
                            minimumSize: const Size(400, 228)
                          ),
                          child: const Text(
                            'Code Correctie',
                            style: TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => QuestionSelection()));
                            //TODO Change page name
                                ;
                          },
                        )
                    )

                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                TableCell(
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(50,50,50,50),
                        child:   TextButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red[800], // Background color
                              minimumSize: const Size(400, 228)
                          ),
                          child: const Text(
                            'Open Vraag',
                            style: TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => QuestionSelection()));
                            //TODO Change page name
                                ;
                          },
                        )
                    )

                ),
                TableCell(
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(50,50,50,50),
                        child:   TextButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red[800], // Background color
                              minimumSize: const Size(400, 228)

                          ),
                          child: const Text(
                            'Alle Vragen',
                            style: TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => QuestionSelection()));
                            //TODO Change page name
                                ;
                          },
                        )
                    )

                ),
              ],
            ),
          ],
        )));
  }
}
