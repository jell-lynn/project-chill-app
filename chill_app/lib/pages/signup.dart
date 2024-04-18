// import 'package:flutter/material.dart';
// import 'package:chill_app/models/user.dart';
// import 'login.dart';

// class Signup extends StatefulWidget {
//   @override
//   _SignupState createState() => _SignupState();
// }

// class _SignupState extends State<Signup> {
//   final _formKey = GlobalKey<FormState>();
//   UserData _userData = UserData();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [Color(0xFF5D43D0), Color(0xFF1B0F51)],
//             ),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Text(
//                     'Sign Up',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 60,
//                       fontFamily: 'PK',
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   _buildInputField('Username', 'Enter your username',
//                       (value) => _userData.username = value),
//                   _buildInputField('Password', 'Enter your password',
//                       (value) => _userData.password = value,
//                       obscureText: true),
//                   _buildInputField('Email', 'Enter your email',
//                       (value) => _userData.email = value),
//                   _buildInputField('Phone Number', 'Enter your phone number',
//                       (value) => _userData.phoneNumber = value),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState.validate()) {
//                         _formKey.currentState.save();

//                         // เพิ่มข้อมูลผู้ใช้งานใหม่ลงในรายการของผู้ใช้งาน
//                         UserData.getuser().add(_userData);

//                         // เปิดหน้า Signup และส่งข้อมูลผู้ใช้งานไปด้วย
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => Signup(userData: _userData),
//                           ),
//                         );
//                       }
//                     },
//                     child: Text('Sign Up'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildInputField(String label, String hint, Function(String) onSave,
//       {bool obscureText = false}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 18,
//           ),
//         ),
//         SizedBox(height: 5),
//         TextFormField(
//           decoration: InputDecoration(
//             hintText: hint,
//             filled: true,
//             fillColor: Color(0xFFF8F0E5),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(25),
//             ),
//           ),
//           validator: (value) {
//             if (value.isEmpty) {
//               return 'Please enter $label';
//             }
//             return null;
//           },
//           onSaved: onSave,
//           obscureText: obscureText,
//         ),
//       ],
//     );
//   }
// }
