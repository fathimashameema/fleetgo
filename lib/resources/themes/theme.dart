import 'package:fleetgo/resources/themes/custom_themes/alert_dialogue_theme.dart';
import 'package:fleetgo/resources/themes/custom_themes/app_bar_theme.dart';
import 'package:fleetgo/resources/themes/custom_themes/checkbox_theme.dart';
import 'package:fleetgo/resources/themes/custom_themes/elevated_button_theme.dart';
import 'package:fleetgo/resources/themes/custom_themes/icons_theme.dart';
import 'package:fleetgo/resources/themes/custom_themes/input_decoration_theme.dart';
import 'package:fleetgo/resources/themes/custom_themes/snack_bar_theme.dart';
import 'package:fleetgo/resources/themes/custom_themes/text_button_theme.dart';
import 'package:fleetgo/resources/themes/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: const Color.fromARGB(255, 232, 141, 14),
      brightness: Brightness.light,
      textTheme: TTexttheme.lightTextTheme,
      elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
      textButtonTheme: TTextButtonTheme.lightTextButtonTheme,
      iconTheme: TIconsTheme.lightIconTheme,
      inputDecorationTheme: TInputDecorationTheme.lightInputdecorationTheme,
      checkboxTheme: TCheckboxTheme.lightCheckBoxTheme,
      appBarTheme: TAppBarTheme.lightAppBarTheme,
      snackBarTheme: TSnackBarTheme.lightSnackBarTheme,
      dialogTheme: TAlertDialogueTheme.lightAlertDialogue);

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      primaryColor: const Color.fromARGB(255, 232, 141, 14),
      textTheme: TTexttheme.darkTextTheme,
      elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
      textButtonTheme: TTextButtonTheme.darkTextButtonTheme,
      iconTheme: TIconsTheme.darkIconTheme,
      inputDecorationTheme: TInputDecorationTheme.darkInputdecorationTheme,
      checkboxTheme: TCheckboxTheme.darkCheckBoxTheme,
      appBarTheme: TAppBarTheme.darkAppBarTheme,
      snackBarTheme: TSnackBarTheme.darkSnackBarTheme,
      dialogTheme: TAlertDialogueTheme.darkAlertDialogue);
}
