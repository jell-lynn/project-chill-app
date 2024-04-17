import 'package:flutter/material.dart';
import 'pages/homeChill.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: Home(), // Set the Home widget as the initial route
    );
  }
}
