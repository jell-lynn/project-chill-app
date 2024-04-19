import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:chill_app/models/user.dart';
import 'package:chill_app/models/login.dart';
import 'package:chill_app/pages/login_page.dart';


class Signup extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

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
                  child: Row(
                    children: [
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 60,
                          fontFamily: 'PK',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Column(
                    children: [
                      _buildInputField('Username', 'Enter your username',
                          _usernameController),
                      SizedBox(height: 10),
                      _buildInputField('Password', 'Enter your password',
                          _passwordController,
                          obscureText: true),
                      SizedBox(height: 10),
                      _buildInputField(
                          'Email', 'Enter your email', _emailController),
                      SizedBox(height: 10),
                      _buildInputField('Phone Number',
                          'Enter your phone number', _phoneNumberController),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () async {
                      String username = _usernameController.text;
                      String password = _passwordController.text;
                      String email = _emailController.text;
                      String phoneNumber = _phoneNumberController.text;

                      // Create a User object from the input data
                      UserData newUser = UserData(
                        username: username,
                        password: password,
                        email: email,
                        phoneNumber: phoneNumber,
                      );

                      // Convert User object to JSON string
                      String userJson = jsonEncode(newUser.toJson());

                      // Access SharedPreferences instance
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();

                      // Save user data to Local Storage using the key 'userData'
                      await prefs.setString('userData', userJson);

                      // Navigate to Login screen after successful signup
                      Navigator.pushReplacement(
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
      ),
    );
  }

  Widget _buildInputField(
      String label, String hint, TextEditingController controller,
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
