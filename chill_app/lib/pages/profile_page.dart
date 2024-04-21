import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chill_app/main.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late User? _currentUser;
  late String _username = '';
  late String _email = '';
  late String _contact = '';

  @override
  void initState() {
    super.initState();
    _currentUser = FirebaseAuth.instance.currentUser;
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    if (_currentUser != null) {
      try {
        DocumentSnapshot<Map<String, dynamic>> userData = await FirebaseFirestore.instance
            .collection('users')
            .doc(_currentUser!.uid)
            .get();

        if (userData.exists) {
          setState(() {
            _username = userData['username'];
            _email = userData['email'];
            _contact = userData['contact'];
          });
        }
      } catch (e) {
        print('Error fetching user data: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: Container(
          height: 100.0,
          child: AppBar(
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://drive.google.com/uc?export=view&id=1TEuoAczH_WCEBC-H0EXBOpVFNVRciSNL',
                  scale: 30,
                ),
                // SizedBox(width: 10),
                Text(
                  'Let’s Chill',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Center(
              child: GestureDetector(
                onTap: () {
                  // Handle image tap action
                },
                child: ClipOval(
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://pbs.twimg.com/media/B-8hNA5VAAAkng7.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                _username,
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'PROFILE',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                'Email',
                style: TextStyle(fontSize: 16),
              ),
              subtitle: Text(
                _email,
                style: TextStyle(fontSize: 20),
              ),
            ),
            ListTile(
              title: Text(
                'Contact',
                style: TextStyle(fontSize: 16),
              ),
              subtitle: Text(
                _contact,
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFDAC0A3)),
                    minimumSize: MaterialStateProperty.all<Size>(
                      Size(double.infinity, 50),
                    ),
                  ),
                  child: Text(
                    'Log Out',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'PK',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
