import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: Color(0xFFDDDDDD),
  accentColor: Color(0XFFc6c6c6),
  textTheme: TextTheme(
    headline1: TextStyle(
      color: Colors.black,
      fontSize: 26,
      fontWeight: FontWeight.w600,
    ),
    bodyText1: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    bodyText2: TextStyle(
      color: Colors.black,
      fontSize: 20,
    ),
    button: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    subtitle1: TextStyle(
      color: Colors.blueGrey,
      fontSize: 40,
      fontWeight: FontWeight.bold,
    ),
    subtitle2: TextStyle(
      color: Colors.black,
      fontSize: 30,
    ),
  ),
  iconTheme: IconThemeData(
    color: Colors.black,
  ),
);

ThemeData darkTheme = ThemeData(
  primaryColor: Color(0XFF3F3D56),
  accentColor: Color(0XFF4e4c6b),
  textTheme: TextTheme(
    headline1: TextStyle(
      color: Colors.white,
      fontSize: 26,
      fontWeight: FontWeight.w600,
    ),
    bodyText1: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w300,
    ),
    bodyText2: TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
    button: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    subtitle1: TextStyle(
      color: Colors.blueGrey,
      fontSize: 40,
      fontWeight: FontWeight.bold,
    ),
    subtitle2: TextStyle(
      color: Colors.white,
      fontSize: 30,
    ),
  ),
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
);
