import 'package:chill_app/pages/homePage.dart';
import 'package:chill_app/pages/status_page.dart';
import 'package:chill_app/pages/profile_page.dart';
import 'package:chill_app/pages/fav_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  String? imageUrl;

  final List<Widget> _pages = [
    HomePage(),
    StatusPage(),
    favPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchImageUrl();
  }

  Future<void> fetchImageUrl() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;

    if (currentUser != null) {
      try {
        DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser.email)
            .get();

        imageUrl = userSnapshot['profileImageUrl'];
      } catch (error) {
        print('Error fetching profile image URL: $error');
      }
    }
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
          // Image.network(
          //   'https://drive.google.com/uc?export=view&id=1TEuoAczH_WCEBC-H0EXBOpVFNVRciSNL',
          //   scale: 20,
          // ),
          Image.asset(
                    'assets/logo.png',
                    scale: 25,
                  ),
          Icon(Icons.window_sharp, size: 50, color: Color(0xFFF9F9F9)),
          Icon(Icons.favorite, size: 50, color: Color(0xFFF9F9F9)),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
              image: DecorationImage(
          image: NetworkImage(
            'https://pbs.twimg.com/media/B-8hNA5VAAAkng7.png',
          ),
          fit: BoxFit.cover,
              ),
              // image: imageUrl != null && imageUrl!.isNotEmpty
              //     ? DecorationImage(
              //         image: NetworkImage(imageUrl!),
              //         fit: BoxFit.cover,
              //       )
              //     : null,
            ),
          ),
        ],
      ),
    );
  }
}
