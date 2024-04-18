import 'package:flutter/material.dart';
import 'dart:convert';

class UserData {
  final String username;
  final String password;
  final String email;
  final String phoneNumber;

  UserData({
    required this.username,
    required this.password,
    required this.email,
    required this.phoneNumber,
  });

  // Convert User object to JSON
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }

  // Factory method to create UserData object from JSON string
  factory UserData.fromJson(String jsonString) {
    // ใช้ jsonDecode เพื่อแปลง JSON string เป็น Map<String, dynamic>
    Map<String, dynamic> json = jsonDecode(jsonString);
    return UserData(
      username: json['username'],
      password: json['password'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
    );
  }

  // Static method to get sample user data
  static List<UserData> getUsers() {
    List<UserData> users = [];
    users.add(UserData(
      username: 'admin',
      password: 'password',
      email: 'admin@gmail.com',
      phoneNumber: '0987654321',
    ));
    users.add(UserData(
      username: 'u6587057',
      password: 'pradthana',
      email: 'kao@gmail.com',
      phoneNumber: '0982505279',
    ));
    users.add(UserData(
      username: 'u6587106',
      password: 'sitthida',
      email: 'ann@gmail.com',
      phoneNumber: '0805935900',
    ));
    return users;
  }
}