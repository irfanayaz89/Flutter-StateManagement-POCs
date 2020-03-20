import 'package:flutter/material.dart';

Map<int, Color> color =
{
  50:Color.fromRGBO(128,0,0, .1),
  100:Color.fromRGBO(128,0,0, .2),
  200:Color.fromRGBO(128,0,0, .3),
  300:Color.fromRGBO(128,0,0, .4),
  400:Color.fromRGBO(128,0,0, .5),
  500:Color.fromRGBO(128,0,0, .6),
  600:Color.fromRGBO(128,0,0, .7),
  700:Color.fromRGBO(128,0,0, .8),
  800:Color.fromRGBO(128,0,0, .9),
  900:Color.fromRGBO(128,0,0, 1),
};

MaterialColor chickenRed = MaterialColor(0xFF800000, color);
Color appAccentColor = Color(0xFFD3D3D3);

ThemeData appTheme = new ThemeData(
  hintColor: Colors.black,
  primarySwatch: chickenRed,
  accentColor: appAccentColor
);

TextStyle textStyle = const TextStyle(
    color: const Color(0XFFFFFFFF),
    fontSize: 16.0,
    fontWeight: FontWeight.normal);

Color textFieldColor = const Color.fromRGBO(255, 255, 255, 0.1);

Color primaryColor = const Color(0xFF00c497);

TextStyle buttonTextStyle = const TextStyle(
    color: const Color.fromRGBO(255, 255, 255, 0.8),
    fontSize: 14.0,
    fontFamily: "Roboto",
    fontWeight: FontWeight.bold);