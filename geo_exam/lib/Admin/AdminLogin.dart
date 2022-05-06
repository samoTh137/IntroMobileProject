import 'package:flutter/material.dart';
import 'package:geo_exam/AdminPage.dart';

class AdminLoginTab extends StatefulWidget {
  const AdminLoginTab({Key? key}) : super(key: key);

  @override
  State<AdminLoginTab> createState() => _AdminLoginTabState();
}

class _AdminLoginTabState extends State<AdminLoginTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[650],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0, bottom: 10.0),
              child: Center(
                child: SizedBox(
                    width: 400,
                    height: 200,
                    child: Image.asset('asset/images/ApLogoColor.png')),
              ),
            ),
            const Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(

                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            TextButton(
              onPressed: (){
                //TODO FORGOT PASSWORD SCREEN GOES HERE
                //print('Forgot password button pressed');
              },
              child: const Text(
                'Forgot Password',
                style: TextStyle(color: Colors.redAccent, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.red[800], borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () { //TODO MAKE ACTUAL LOGIN SYSTEM (FIREBASE)
                  //!!!USING LOGIN BUTTON TO ACCESS ADMINPAGE ==> REMOVE THIS LATER!!!
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => AdminPage()));
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text('New User? Create Account'),

            const SizedBox(
              height: 100,
            ),
            /*ListTile(
              title: Row(
                children: <Widget>[
                  Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (_) => const AdminPage()));
                        },
                        child: const Text("Admin"),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red[800],
                            minimumSize: const Size(0, 80),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            )
                        ),)),
                  Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (_) => const UserPage()));
                        },
                        child: const Text("User"),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red[800],
                            minimumSize: const Size(0, 80),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            )
                        ),)),
                ],
              ),
            )*/
          ],
        ),
      ),
    );
  }
}
