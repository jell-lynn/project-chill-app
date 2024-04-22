import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:chill_app/models/login.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String? _selectedImageUrl;

  List<String> imageUrls = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZdbze89zqCxOm_n1H8WaMdZ7IH1oe8x7LbN_2ova-d8DV2TnblLhvPdEwRvVxBFFWhtA&usqp=CAU',
    'https://secretsurpriseshop.com/cdn/shop/collections/IMG_2102_800x800.jpg?v=1596833937',
    'https://is4-ssl.mzstatic.com/image/thumb/Purple126/v4/b5/cc/df/b5ccdf35-5bed-7f31-7bba-d907b6d74e55/AppIcon-0-1x_U007emarketing-0-7-0-sRGB-85-220.png/512x512bb.jpg',
    'https://teeturtle.com/cdn/shop/files/HKF-My-Melody-and-Kuromi_4200x4200_SEPS.jpg?v=1703414831&width=1946',
    'https://yt3.googleusercontent.com/VB0_8gPDwcKYd_wVCJdWcwjttoQu1Xle7EUInFxxfMM5kgYdoFJWyPJ6pdcdRy3FU2B6MHYOKw=s900-c-k-c0x00ffffff-no-rj',
    'https://pbs.twimg.com/media/B-8hNA5VAAAkng7.png',
    'https://www.central.co.th/e-shopping/wp-content/uploads/2017/01/017keroppi.png',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR15xNcME7aAbsWjS72R6o8uDANqCJeb7yezDoNYxD1lg&s',
    'https://pbs.twimg.com/media/E1MU78XWQAYJnuN.jpg',
    'https://www.central.co.th/e-shopping/wp-content/uploads/2017/01/020badtzmaru.png',
    'https://pbs.twimg.com/media/C8BXK5KVsAA5NYb.jpg',
    'https://play-lh.googleusercontent.com/Rjyylt1cF6Vs1A8lJZm8yqJJPDOJfk0_BBIoiK6h0V1QENGAHG9tIOD-0eM-odrS3w=w526-h296-rw',
  ];

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  bool isEmailValid(String email) {
    return email.contains('@') && email.contains('.');
  }

  bool isPhoneNumberValid(String phoneNumber) {
    String cleanedPhoneNumber = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');
    return cleanedPhoneNumber.length == 10;
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Sign Up Failed'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF5D43D0),
              Color(0xFF1B0F51)
            ], // Set your desired gradient colors
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
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
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Color(0xFFF8F0E5),
                        backgroundImage: _selectedImageUrl != null
                            ? NetworkImage(_selectedImageUrl!)
                            : null,
                      ),
                      Positioned(
                        left: 0,
                        bottom: 0,
                        child: InkWell(
                          onTap: _selectImage,
                          borderRadius: BorderRadius.circular(18),
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.camera_alt_rounded, size: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _buildInputField(
                      'Username', 'Enter your username', _usernameController),
                  _buildInputField(
                      'Password', 'Enter your password', _passwordController,
                      obscureText: true),
                  _buildInputField(
                      'Email', 'Enter your email', _emailController),
                  _buildInputField('Phone Number', 'Enter your phone number',
                      _phoneNumberController),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: _signUp,
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
                  SizedBox(height: 20), // Adding extra space below the button
                ],
              ),
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
        SizedBox(height: 10), // Adjust spacing between input fields
      ],
    );
  }

  void _selectImage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Image'),
          content: Container(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, // Display 4 items per row
                      crossAxisSpacing: 1.0, // Minimal horizontal spacing
                      mainAxisSpacing: 1.0, // Minimal vertical spacing
                      childAspectRatio: 1.0, // Aspect ratio of each grid item
                    ),
                    itemCount: imageUrls.length, // Total number of items
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedImageUrl = imageUrls[index];
                          });
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: 60, // Adjust width of the container
                          height: 60, // Adjust height of the container
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 30, // Adjust the radius of the CircleAvatar
                            child: ClipOval(
                              child: Image.network(
                                imageUrls[index],
                                fit: BoxFit.cover, // Maintain aspect ratio
                                width: 60, // Match container width
                                height: 60, // Match container height
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _signUp() async {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();
    String email = _emailController.text.trim();
    String phoneNumber = _phoneNumberController.text.trim();

    if (_selectedImageUrl == null) {
      _showErrorDialog(context, 'Please select a profile image.');
      return;
    }

    if (username.isEmpty) {
      _showErrorDialog(context, 'Please enter username.');
      return;
    }

    if (password.isEmpty) {
      _showErrorDialog(context, 'Please enter password.');
      return;
    }

    if (!isEmailValid(email)) {
      _showErrorDialog(
          context, 'Invalid email format. Please enter a valid email.');
      return;
    }

    if (!isPhoneNumberValid(phoneNumber)) {
      _showErrorDialog(context,
          'Invalid phone number format. Please enter a 10-digit phone number.');
      return;
    }

    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) async {
        // create data to firebase
        Map<String, dynamic> userData = {
          'username': username,
          'email': email,
          'phoneNumber': phoneNumber,
          'profileImageUrl': _selectedImageUrl,
          'createdAt': FieldValue.serverTimestamp(),
        };

        // create reference
        final userReference =
            FirebaseFirestore.instance.collection('users').doc(value.user!.uid);

        await userReference.set(userData);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
      });

    } catch (e) {
      _showErrorDialog(
          context, 'Failed to create an account. Please try again.');
    }
  }
}
