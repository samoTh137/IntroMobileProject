import 'package:flutter/material.dart';
import 'package:geo_exam/Admin/AdminLogin.dart';
import 'package:geo_exam/User/UserLogin.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int currentTab = 0;
  final screens = [
    const AdminLoginTab(),
    const UserLoginTab()
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentTab = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: screens.elementAt(currentTab),
      ),
      bottomNavigationBar:BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Admin',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'User',
          ),
        ],
        currentIndex: currentTab,
        selectedItemColor: Colors.red[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
