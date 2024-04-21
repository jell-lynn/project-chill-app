// // int _selectedIndex = 2; // เพิ่มตัวแปร _selectedIndex เพื่อเลือก Tab โดยค่าเริ่มต้นคือ 2 (LiveMap)

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: PreferredSize(
// //         preferredSize: Size.fromHeight(100.0),
// //         child: Container(
// //           height: 100.0,
// //           child: AppBar(
// //             elevation: 0,
// //             title: Column(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     Image.asset(
// //                       'assets/logo.png',
// //                       scale: 30,
// //                     ),
// //                     SizedBox(width: 10),
// //                     Text(
// //                       'Let’s Chill',
// //                       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
// //                     ),
// //                   ],
// //                 ),
// //                 SizedBox(height: 3),
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.start,
// //                   children: [
// //                     TextButton(
// //                       onPressed: () {
// //                         setState(() {
// //                           _selectedIndex = 0;
// //                         });
// //                       },
// //                       child: Text(
// //                         'Swipe',
// //                         style: TextStyle(
// //                           fontWeight: _selectedIndex == 0
// //                               ? FontWeight.bold
// //                               : FontWeight.normal,
// //                           fontSize: 20,
// //                           decoration: _selectedIndex == 0
// //                               ? TextDecoration.underline
// //                               : TextDecoration.none,
// //                           color: _selectedIndex == 0
// //                               ? Color(0xFF172B4D)
// //                               : Color(0xFF666666),
// //                         ),
// //                       ),
// //                     ),
// //                     TextButton(
// //                       onPressed: () {
// //                         setState(() {
// //                           _selectedIndex = 1;
// //                         });
// //                       },
// //                       child: Text(
// //                         'Nearby',
// //                         style: TextStyle(
// //                           fontWeight: _selectedIndex == 1
// //                               ? FontWeight.bold
// //                               : FontWeight.normal,
// //                           fontSize: 20,
// //                           decoration: _selectedIndex == 1
// //                               ? TextDecoration.underline
// //                               : TextDecoration.none,
// //                           color: _selectedIndex == 1
// //                               ? Color(0xFF172B4D)
// //                               : Color(0xFF666666),
// //                         ),
// //                       ),
// //                     ),
// //                     TextButton(
// //                       onPressed: () {
// //                         setState(() {
// //                           _selectedIndex = 2;
// //                         });
// //                       },
// //                       child: Text(
// //                         'LiveMap',
// //                         style: TextStyle(
// //                           fontWeight: _selectedIndex == 2
// //                               ? FontWeight.bold
// //                               : FontWeight.normal,
// //                           fontSize: 20,
// //                           decoration: _selectedIndex == 2
// //                               ? TextDecoration.underline
// //                               : TextDecoration.none,
// //                           color: _selectedIndex == 2
// //                               ? Color(0xFF172B4D)
// //                               : Color(0xFF666666),
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );


// import 'package:chill_app_mobile/main.dart';
// import 'package:flutter/material.dart';

// class ProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           SizedBox(height: 20),
//           Center(
//             child: Container(
//               width: 120,
//               height: 120,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Color(0xFFE6E6E6),
//               ),
//               child: IconButton(
//                 icon: Icon(Icons.person),
//                 onPressed: () {
//                   // สามารถเพิ่มการทำงานเมื่อกดปุ่มที่นี่
//                 },
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//           Center(
//             child: Text(
//               'username',
//               style: TextStyle(fontSize: 24),
//             ),
//           ),
//           SizedBox(height: 20),
//           Padding(
//             padding: const EdgeInsets.only(left: 16.0),
//             child: Text(
//               'PROFILE',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Divider(),
//           ListTile(
//             title: Text(
//               'Email',
//               style: TextStyle(fontSize: 16),
//             ),
//             subtitle: Text(
//               'Email address',
//               style: TextStyle(fontSize: 18),
//             ),
//           ),
//           ListTile(
//             title: Text(
//               'Contact',
//               style: TextStyle(fontSize: 16),
//             ),
//             subtitle: Text(
//               '+66 XXXXXXXXXX',
//               style: TextStyle(fontSize: 18),
//             ),
//           ),
//           SizedBox(height: 20),
//           Center(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 30.0), // กำหนด Padding สำหรับปุ่ม Log Out 
//               child: ElevatedButton(
//                 onPressed: () {
//                   // เมื่อกดปุ่ม Log Out ให้นำผู้ใช้ไปยังหน้าหลัก (main page)
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(builder: (context) => MyApp()), // กำหนดหน้าหลักที่ต้องการไป
//                   );
//                 },
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFDAC0A3)),
//                   minimumSize: MaterialStateProperty.all<Size>(
//                     Size(double.infinity, 50), // กำหนดความยาวและความสูงของปุ่ม
//                   ),
//                 ),
//                 child: Text(
//                   'Log Out',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 24,
//                     fontFamily: 'PK',
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

