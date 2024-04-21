import 'package:flutter/material.dart';
import 'package:chill_app/models/login.dart';
import 'package:chill_app/models/signup.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
                child: Image(
                  image: NetworkImage(
                    'https://drive.google.com/uc?view&id=1TEuoAczH_WCEBC-H0EXBOpVFNVRciSNL'),),
              ),
              // SizedBox(height: 5),
              Text(
                "Let's Chill",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 64,
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
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFFDAC0A3)),
                    minimumSize: MaterialStateProperty.all<Size>(
                        Size(double.infinity, 50)),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
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
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFFDAC0A3)),
                    minimumSize: MaterialStateProperty.all<Size>(
                        Size(double.infinity, 50)),
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
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
