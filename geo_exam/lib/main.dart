import 'package:flutter/material.dart';
import 'Home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
            future: _fbApp,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print('An error occurred! ${snapshot.error.toString()}');
                return const Text('Oops, something went wrong :(');
              } else if (snapshot.hasData) {
                return const MainHome();
              } else {
                return const Center(
                    child: CircularProgressIndicator()
                );
              }
            }
        )
    );
  }
}