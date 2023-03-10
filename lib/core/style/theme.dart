
import 'package:flutter/material.dart';

class MyTheme {

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      color: Colors.green,
    ),
    primaryColor: Colors.green,
    textTheme: const TextTheme(
      headline6: TextStyle(
        fontSize: 22,
        color: Colors.white,
        fontWeight: FontWeight.w500
      )
    )
  );
}