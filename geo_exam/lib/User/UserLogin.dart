import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:geo_exam/UserPage.dart';
import 'package:firebase_database/firebase_database.dart';

//import 'Exam.dart';
List<String> items = ['', '', '', ''];
List<DropdownMenuItem<String>>? dropdownitems;
late final String? loggedInUser;

class UserLoginTab extends StatefulWidget {
  const UserLoginTab({Key? key}) : super(key: key);

  @override
  State<UserLoginTab> createState() => _UserLoginTabState();
}

class _UserLoginTabState extends State<UserLoginTab> {
  String? dropdownvalue;

  @override
  void initState() {
    super.initState();
    _loadFromDB();
  }

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
                child: DropdownButton2<String>(
                  hint: Text(
                    'Select student',
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: dropdownitems,
                  value: dropdownvalue,
                  onChanged: (value) {
                    setState(() {
                      dropdownvalue = value as String;
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => UserPage(user: value,)
                        ));
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

  void _loadFromDB(){
    DatabaseReference ref = FirebaseDatabase.instance.ref('Users');
    ref.get().then((snapshot) {
      for (int i = 0; i <= items.length; i++) {
        String username = "User$i";
        if (snapshot.hasChild(username.toString())) {
          DataSnapshot parentSnapshot = snapshot.child(username);
          //print(parentSnapshot.key.toString());//This is what you need to send to value
          items[i] = parentSnapshot.key.toString();
        } else {break;}
      }
      _loadToDropdown();
    });
  }

  void _loadToDropdown() {
    setState(() {
      dropdownitems = items
          .map((item) => DropdownMenuItem<String>(
        value: item,
        child: Text(
          item,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ))
          .toList();
    });
  }
}
