import 'package:flutter/material.dart';
import 'package:chill_app/models/bottom_navigation.dart';
import 'package:chill_app/models/signup.dart';
import 'package:chill_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _loginUser(BuildContext context) async {
    String enteredUsername = _usernameController.text;
    String enteredPassword = _passwordController.text;

    // Get user data from UserData class
    List<UserData> users = UserData.getUsers();

    // Get user data from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedUserData = prefs.getString('userData');

    // Check if entered username and password match any user in the system
    bool isAuthenticated = users.any((user) =>
        user.username == enteredUsername && user.password == enteredPassword);

    if (isAuthenticated) {
      // Navigate to home page if authentication is successful
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNavigation()),
      );
    }
    
    else if (storedUserData != null) {
      UserData storedUser = UserData.fromJson(storedUserData);

      // Check if entered username and password match the stored user data
      if (storedUser.username == enteredUsername && storedUser.password == enteredPassword) {
        // Navigate to home page if authentication is successful
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BottomNavigation()),
        );
      } else {
        // Show error message for invalid username or password
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Login Failed'),
            content: Text('Invalid username or password. Please try again.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    } else {
      // Show error message if no user data is found
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Failed'),
          content: Text('User data not found. Please sign up first.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
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
              mainAxisAlignment: MainAxisAlignment.start,
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
                  height: 50,
                ),
                // Text fields for username and password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Column(
                    children: [
                      _buildInputField('Username', 'Enter your username',
                          _usernameController),
                      SizedBox(
                        height: 20,
                      ),
                      _buildInputField('Password', 'Enter your password',
                          _passwordController,
                          obscureText: true),
                    ],
                  ),
                ),
                // Button to perform login action
                SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      _loginUser(context); // Call _loginUser function
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
                SizedBox(height: 10),
                Row(
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
                        Navigator.push(
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, String hint,
      TextEditingController controller,
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
