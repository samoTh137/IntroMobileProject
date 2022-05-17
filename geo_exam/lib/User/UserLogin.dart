import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:geo_exam/UserPage.dart';

import 'Exam.dart';

class UserLoginTab extends StatefulWidget {
  const UserLoginTab({Key? key}) : super(key: key);

  @override
  State<UserLoginTab> createState() => _UserLoginTabState();
}

class _UserLoginTabState extends State<UserLoginTab> {
  List<String> items =  <String>['s123463','s158563','s137783'];
  String? dropdownvalue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("User"),
        backgroundColor: Colors.red[800],
      ),
      body: Column(
        children: <Widget>[
           Padding(
             padding: const EdgeInsets.all(20.0),
             child: SizedBox(
              width: 300,
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  hint: Text(
                    'Select student',
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme
                          .of(context)
                          .hintColor,
                    ),
                  ),
                  items: items
                      .map((item) =>
                      DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ))
                      .toList(),
                  value: dropdownvalue,
                  onChanged: (value) {
                    setState(() {
                      dropdownvalue = value as String;
                    });
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (_) => const UserPage()));
                  },

                  buttonHeight: 40,
                  buttonWidth: 140,
                  itemHeight: 40,
                ),
              ),
            ),
           ),
        ],
      ),
    );
  }
}
