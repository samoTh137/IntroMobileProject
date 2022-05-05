import 'package:flutter/material.dart';
import 'QuestionSelection.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
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
                      'Logout',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                )),
          ]),
      body: Column(children: [
        const SizedBox(
          height: 300,
        ),
        Table(
          columnWidths: const <int, TableColumnWidth>{
            0: IntrinsicColumnWidth(),
            1: FlexColumnWidth(),
            2: FixedColumnWidth(300),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,

          children: <TableRow>[
            TableRow(
              children: <Widget>[
                Container(
                  height: 50,
                ),
                TableCell(
                  //TableCell voor Examen
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => QuestionSelection()));
                        },
                        child: const Text('Maak een examen'),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red[800],
                            minimumSize: const Size(0, 80),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ))),
                  )
                ),
                TableCell(
                  //TableCell voor Studenten
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: ElevatedButton(
                      onPressed: () {
                      },
                      child: const Text('Studenten'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red[800],
                        minimumSize: const Size(0, 80),
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ))),
                  ),
                ),
                TableCell(
                  //TableCell voor Wachtwoord
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: ElevatedButton(
                      onPressed: () {
                      },
                      child: const Text('Wachtwoord wijzigen'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red[800],
                        minimumSize: const Size(100, 80),
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ))),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 100,
        ),
        const Text('Here comes other stuff',
          style:TextStyle(fontSize: 30),),
      ]
      ),
    );
  }
}
