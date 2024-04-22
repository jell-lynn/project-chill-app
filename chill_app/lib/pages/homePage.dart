import 'package:flutter/material.dart';
import 'package:chill_app/pages/home_swipe.dart';
import 'package:chill_app/pages/home_nearby.dart';
import 'package:chill_app/pages/home_livemap.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeSwipe(),
    NearbyPage(),
    LiveMapPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: Container(
          height: 100.0,
          child: AppBar(
          elevation: 0,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                //    Image.network(
                //   'https://drive.google.com/uc?export=view&id=1TEuoAczH_WCEBC-H0EXBOpVFNVRciSNL',
                //   scale: 30,
                // ),
                Image.asset(
                    'assets/logo.png',
                    scale: 25,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Let’s Chill',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                ],
              ),
              SizedBox(height: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                    child: Text(
                      'Swipe',
                      style: TextStyle(
                        fontWeight: _selectedIndex == 0
                            ? FontWeight.bold
                            : FontWeight.normal,
                        fontSize: 20,
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
                      setState(() {
                        _selectedIndex = 1;
                      });
                    },
                    child: Text(
                      'Nearby',
                      style: TextStyle(
                        fontWeight: _selectedIndex == 1
                            ? FontWeight.bold
                            : FontWeight.normal,
                        fontSize: 20,
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
                      setState(() {
                        _selectedIndex = 2;
                      });
                    },
                    child: Text(
                      'LiveMap',
                      style: TextStyle(
                        fontWeight: _selectedIndex == 2
                            ? FontWeight.bold
                            : FontWeight.normal,
                        fontSize: 20,
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
        ),
        ),
      body: _pages[_selectedIndex],
      
    );
  }
}
