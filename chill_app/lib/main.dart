import 'package:flutter/material.dart';
import 'package:chill_app/pages/login_page.dart';
// import 'package:chill_app/pages/home_swipe.dart';
// import 'package:chill_app/models/bottom_navigation.dart';

// import 'package:provider/provider.dart';
// import 'package:chill_app/models/login_status.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      // home: HomeSwipe(),
      // home: BottomNavigation(),
      // home: Consumer<AuthModel>(
      //     builder: (context, auth, child) {
      //       return auth.isLoggedIn ? HomeSwipe() : HomeLogin();
      //     },
      //   ),
    );
  }
}
