import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:go_router/go_router.dart';

=======
import 'package:chill_app/pages/login_page.dart';
// import 'package:chill_app/pages/home_swipe.dart';
>>>>>>> main
import 'package:chill_app/models/bottom_navigation.dart';
import 'package:chill_app/models/signup.dart';
// import 'package:chill_app/pages/login_page.dart';
import 'package:chill_app/pages/profile_page.dart';
import 'package:chill_app/pages/status_page.dart';
import 'package:chill_app/pages/info_page.dart';


// import 'package:provider/provider.dart';
// import 'package:chill_app/models/login_status.dart';

void main() {
  runApp(MyApp());
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const BottomNavigation();
      },
      routes: [
        GoRoute(
          path: 'info',
          builder: (BuildContext context, GoRouterState state) {
          return InfoPage();
          },
        ),
        GoRoute(
          path: 'status',
          builder: (BuildContext context, GoRouterState state) {
          return const StatusPage();
          },
        ),
        GoRoute(
          path: 'profile',
          builder: (BuildContext context, GoRouterState state) {
          return const ProfilePage();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'chillApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
<<<<<<< HEAD
      routerConfig: _router,
      // home: LoginPage(),
=======
      home: LoginPage(),
>>>>>>> main
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