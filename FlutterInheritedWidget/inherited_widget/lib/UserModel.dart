import 'package:flutter/material.dart';

class Printable {

  // to avoid making the class extendable
  factory Printable._() => null;

  printOutput(String username, String name) {
    print("Username:: $username && Name:: $name");
  }
}

class UserModel with Printable {

  String username;
  String name;

  UserModel({@required  this.username, @required this.name});
}