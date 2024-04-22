// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:chill_app/pages/login_page.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:chill_app/models/bottom_navigation.dart';
 
// class ProfilePage extends StatefulWidget {
//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: FutureBuilder<DocumentSnapshot>(
//           future: getUserData(), // เรียกใช้ Future สำหรับดึงข้อมูลผู้ใช้
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: CircularProgressIndicator());
//             } else {
//               if (snapshot.hasError) {
//                 return Center(child: Text('Error: ${snapshot.error}'));
//               } else {
//                 // ดึงข้อมูลผู้ใช้จาก snapshot
//                 var userData = snapshot.data;
//                 String username = userData!['username'];
//                 String emailAddress = userData['email'];
//                 String contact = userData['contact'];
//                 String imageUrl = userData['imageUrl'];
 
//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     SizedBox(height: 20),
//                     Center(
//                       child: CircleAvatar(
//                         radius: 60,
//                         backgroundImage: NetworkImage(imageUrl),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Center(
//                       child: Text(
//                         username,
//                         style: TextStyle(fontSize: 24),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 16.0),
//                       child: Text(
//                         'PROFILE',
//                         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Divider(),
//                     ListTile(
//                       title: Text(
//                         'Email',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                       subtitle: Text(
//                         emailAddress,
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ),
//                     ListTile(
//                       title: Text(
//                         'Contact',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                       subtitle: Text(
//                         contact,
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Center(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                         child: ElevatedButton(
//                           onPressed: () async {
//                             await _auth.signOut();
//                             Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(builder: (context) => BottomNavigation()),
//                             );
//                           },
//                           style: ButtonStyle(
//                             backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFDAC0A3)),
//                             minimumSize: MaterialStateProperty.all<Size>(
//                               Size(double.infinity, 50),
//                             ),
//                           ),
//                           child: Text(
//                             'Log Out',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 24,
//                               fontFamily: 'PK',
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//               }
//             }
//           },
//         ),
//       ),
//     );
//   }

//   Future<DocumentSnapshot> getUserData() async {
//     String? userId = _auth.currentUser?.uid; // ระบุ ID ของผู้ใช้ที่ต้องการดึงข้อมูล
//     if (userId != null) {
//       return await FirebaseFirestore.instance.collection('users').doc(userId).get();
//     } else {
//       throw 'User ID is null';
//     }
//     // return await FirebaseFirestore.instance.collection('users').doc(userId).get();
//   }
// }

import 'package:chill_app/pages/login_page.dart';
import 'package:flutter/material.dart';
 
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 70),
            Center(
              child: GestureDetector(
                onTap: () {
                  // รายละเอียดการทำงานเมื่อคลิกที่รูปภาพ
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
                'kaokhao',
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
                'kaopscy9802@gmail.com',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ListTile(
              title: Text(
                'Contact',
                style: TextStyle(fontSize: 16),
              ),
              subtitle: Text(
                '+66 982505279',
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
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF281483)),
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
