import 'package:chill_app/pages/homePage.dart';
import 'package:chill_app/pages/status_page.dart';
import 'package:chill_app/pages/profile_page.dart';
// import 'package:chill_app/models/app_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    StatusPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color(0xFFF9F9F9),
        color: Color(0xFF281483),
        animationDuration: Duration(milliseconds: 300),
        onTap: _onItemTapped,
        items: [
          Image.asset('assets/logo.png', width: 50, height: 50),
          Icon(Icons.window_sharp, size: 50, color: Color(0xFFF9F9F9)),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
              image: DecorationImage(
                image: AssetImage('assets/kuromi.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}