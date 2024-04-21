import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
 
import 'package:chill_app/models/bottom_navigation.dart';
import 'package:chill_app/models/signup.dart';
 
class Login extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
 
  Future<void> _loginUser(BuildContext context) async {
    String enteredEmail = _emailController.text;
    String enteredPassword = _passwordController.text;
 
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: enteredEmail,
        password: enteredPassword,
      );
 
      // Authentication successful, navigate to home page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavigation()),
      );
    } catch (e) {
      // Authentication failed
      Fluttertoast.showToast(
        msg: 'Invalid email or password. Please try again.',
        gravity: ToastGravity.CENTER,
      );
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Column(
                    children: [
                      Text(
                        'Welcome Back!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontFamily: 'PK',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Login to continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'PK',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                // Text fields for email and password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Column(
                    children: [
                      _buildInputField('Email', 'Enter your email', _emailController),
                      SizedBox(height: 20),
                      _buildInputField('Password', 'Enter your password', _passwordController, obscureText: true),
                    ],
                  ),
                ),
                // Button to perform login action
                SizedBox(height: 30),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      _loginUser(context); // Call _loginUser function
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFDAC0A3)),
                      minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 50)),
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
                SizedBox(height: 10),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account? ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'PK',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Signup()),
                          );
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Color(0xFFDAC0A3),
                            fontSize: 16,
                            fontFamily: 'PK',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
 
  Widget _buildInputField(String label, String hint, TextEditingController controller,
      {bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 5),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Color(0xFFF8F0E5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          obscureText: obscureText,
        ),
      ],
    );
  }
}