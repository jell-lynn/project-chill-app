import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // กำหนดสีพื้นหลังของหน้าจอให้ไล่ระดับสี
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF5D43D0), Color(0xFF1B0F51)],
          ),
        ),
        child: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      SizedBox(
        height: 350,
        child: Image.asset('assets/logo.png'),
      ),
      // SizedBox(height: 5), 
      Text(
        "Let's Chill",
        style: TextStyle(
          color: Colors.white,
          fontSize:64,
          fontFamily: 'PK',
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 20),
      SizedBox(
        width: 250,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
          },
          style: ElevatedButton.styleFrom(
            primary: Color(0xFFDAC0A3),
            minimumSize: Size(double.infinity, 50),
          ),
          child: Text(
            'Login',
            style: TextStyle(color: Colors.white,
            fontSize:24,
            fontFamily: 'PK',
            fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      SizedBox(height: 20), // เพิ่มระยะห่างระหว่างปุ่ม
      // Button to navigate to the Signup screen
      SizedBox(
        width: 250,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Signup()),
            );
          },
          style: ElevatedButton.styleFrom(
            primary: Color(0xFFDAC0A3),
            minimumSize: Size(double.infinity, 50),
          ),
          child: Text(
            'Sign UP',
            style: TextStyle(color: Colors.white,
            fontSize:24,
            fontFamily: 'PK',
            fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ],
  ),
),


      ),
    );
  }
}
