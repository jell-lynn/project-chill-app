import 'package:flutter/material.dart';
// import 'package:chill_app/models/bottom_navigation.dart';
import 'package:chill_app/pages/home_swipe.dart';
import 'package:chill_app/pages/home_nearby.dart';
import 'package:chill_app/pages/home_livemap.dart';


class appBar extends StatefulWidget {
  const appBar ({super.key});

  @override
  State<appBar> createState() => _appBarState();
}

class _appBarState extends State<appBar> {
  int _selectedIndex = 0;

  final List<Widget> _UpPages = [
    HomeSwipe(),
    NearbyPage(),
    LiveMapPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    scale: 40,
                  ),
                  Text(
                    'Let’s Chill',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeSwipe()),
                      );
                    },
                    child: Text(
                      'Swipe',
                      style: TextStyle(
                        fontWeight: _selectedIndex == 0
                            ? FontWeight.bold
                            : FontWeight.normal,
                        fontSize: 16,
                        decoration: _selectedIndex == 0
                            ? TextDecoration.underline
                            : TextDecoration.none,
                        color: _selectedIndex == 0
                            ? Color(0xFF172B4D)
                            : Color(0xFF666666),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NearbyPage()),
                      );
                    },
                    child: Text(
                      'Nearby',
                      style: TextStyle(
                        fontWeight: _selectedIndex == 1
                            ? FontWeight.bold
                            : FontWeight.normal,
                        fontSize: 16,
                        decoration: _selectedIndex == 1
                            ? TextDecoration.underline
                            : TextDecoration.none,
                        color: _selectedIndex == 1
                            ? Color(0xFF172B4D)
                            : Color(0xFF666666),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LiveMapPage()),
                      );
                    },
                    child: Text(
                      'LiveMap',
                      style: TextStyle(
                        fontWeight: _selectedIndex == 2
                            ? FontWeight.bold
                            : FontWeight.normal,
                        fontSize: 16,
                        decoration: _selectedIndex == 2
                            ? TextDecoration.underline
                            : TextDecoration.none,
                        color: _selectedIndex == 2
                            ? Color(0xFF172B4D)
                            : Color(0xFF666666),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
      ),
    );
  }
}