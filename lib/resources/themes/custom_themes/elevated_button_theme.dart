import 'package:flutter/material.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: const Color.fromARGB(255, 223, 159, 159),
          backgroundColor: Colors.amber,
          disabledBackgroundColor: Colors.black,
          disabledForegroundColor: Colors.blue,
          side: const BorderSide(color: Colors.blueGrey),
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          textStyle: const TextStyle(
              fontSize: 15,
              color: Colors.yellow,
              fontWeight: FontWeight.w400)));


static final darkElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: const Color.fromARGB(255, 223, 159, 159),
          backgroundColor: Colors.amber,
          disabledBackgroundColor: Colors.black,
          disabledForegroundColor: Colors.blue,
          side: const BorderSide(color: Colors.blueGrey),
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          textStyle: const TextStyle(
              fontSize: 15,
              color: Colors.yellow,
              fontWeight: FontWeight.w400)));}
