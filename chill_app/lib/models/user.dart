import 'package:flutter/material.dart';
import 'dart:convert';

class UserData {
  final String name;
  final String username;
  final String password;
  final String email;
  final String phoneNumber;
  final String imageToken;

  UserData({
    required this.name,
    required this.username,
    required this.password,
    required this.email,
    required this.phoneNumber,
    required this.imageToken,
  });

  // Convert User object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
      'password': password,
      'email': email,
      'phoneNumber': phoneNumber,
      'imageToken': imageToken,
    };
  }

  // Factory method to create UserData object from JSON string
  factory UserData.fromJson(String jsonString) {
    // ใช้ jsonDecode เพื่อแปลง JSON string เป็น Map<String, dynamic>
    Map<String, dynamic> json = jsonDecode(jsonString);
    return UserData(
      name: json['name'],
      username: json['username'],
      password: json['password'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      imageToken: json['imageToken'],
    );
  }

  // Static method to get sample user data
  static List<UserData> getUsers() {
    List<UserData> users = [];
    users.add(UserData(
      name: 'Peung Peung',
      username: 'admin',
      password: 'password',
      email: 'admin@gmail.com',
      phoneNumber: '0987654321',
      imageToken: '1DokhXB9ctGvtjtO2Unegn_uWXaQub7VQ',
    ));
    users.add(UserData(
      name: 'kkcykao',
      username: 'u6587057',
      password: 'pradthana',
      email: 'kao@gmail.com',
      phoneNumber: '0982505279',
      imageToken: '1xRBr4RUwz34FlFgd_JtfbaLkXtp4XkKE',
    ));
    users.add(UserData(
      name: 'sanntidraa',
      username: 'u6587106',
      password: 'sitthida',
      email: 'ann@gmail.com',
      phoneNumber: '0805935900',
      imageToken: '1wQHiiG3Juu_HuU_s4F6jsbAcc4Y83dJf',
    ));
    return users;
  }
}