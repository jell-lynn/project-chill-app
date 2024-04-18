import 'package:flutter/material.dart';

class UserData {
  String username;
  String password;
  String email;
  String phoneNumber;

  UserData(
      {required this.username,
      required this.password,
      required this.email,
      required this.phoneNumber});

  static List<UserData> getuser() {
    List<UserData> user = [];
    user.add(UserData(
      username: 'admin',
      password: 'password',
      email: 'admin@gmail.com',
      phoneNumber: '0987654321',
    ));
    user.add(UserData(
      username: 'u6587057',
      password: 'pradthana',
      email: 'kao@gmail.com',
      phoneNumber: '0982505279',
    ));
    user.add(UserData(
      username: 'u6587106',
      password: 'sitthida',
      email: 'ann@gmail.com',
      phoneNumber: '0805935900',
    ));

    return user;
  }
}
