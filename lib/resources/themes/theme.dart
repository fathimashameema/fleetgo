import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: const Color.fromARGB(255, 232, 141, 14),
      textTheme: TextTheme());
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.black,
      primaryColor: const Color.fromARGB(255, 232, 141, 14),
      textTheme: TextTheme());
}
