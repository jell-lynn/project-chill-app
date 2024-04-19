import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:chill_app/models/user.dart';
import 'package:chill_app/models/login.dart';

class Signup extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _imageTokenController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF5D43D0), Color(0xFF1B0F51)],
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontFamily: 'PK',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _buildInputField('Name', 'Enter your Name', _nameController),
                  _buildInputField('Username', 'Enter your username', _usernameController),
                  _buildInputField('Password', 'Enter your password', _passwordController, obscureText: true),
                  _buildInputField('Email', 'Enter your email', _emailController),
                  _buildInputField('Phone Number', 'Enter your phone number', _phoneNumberController),
                  _buildInputField('Image Token', 'Enter your Image Token', _imageTokenController),
                  SizedBox(height: 20),
                  Text(
                    'Image Link: https://drive.google.com/file/d/1cpphNq0oW64ERaADfJUR8HafqTfS8Ccv/view?usp=drive_link',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Image Token: 1cpphNq0oW64ERaADfJUR8HafqTfS8Ccv',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () async {
                        String name = _nameController.text;
                        String username = _usernameController.text;
                        String password = _passwordController.text;
                        String email = _emailController.text;
                        String phoneNumber = _phoneNumberController.text;
                        String imageToken = _imageTokenController.text;

                        UserData newUser = UserData(
                          name: name,
                          username: username,
                          password: password,
                          email: email,
                          phoneNumber: phoneNumber,
                          imageToken: imageToken,
                        );

                        String userJson = jsonEncode(newUser.toJson());

                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        await prefs.setString('userData', userJson);

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFDAC0A3)),
                        minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 50)),
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
      ),
    );
  }

  Widget _buildInputField(String label, String hint, TextEditingController controller, {bool obscureText = false}) {
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
        SizedBox(height: 10), // Adjust spacing between input fields
      ],
    );
  }
}
