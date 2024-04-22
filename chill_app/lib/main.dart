import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:chill_app/models/bottom_navigation.dart';
import 'package:chill_app/pages/login_page.dart';
import 'package:chill_app/pages/home_nearby.dart';


import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
        // return const NearbyPage();
      },
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
      routerConfig: _router,

    );
  }
}

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: LoginPage(),
//         ),
//       ),
//     );
//   }
// }