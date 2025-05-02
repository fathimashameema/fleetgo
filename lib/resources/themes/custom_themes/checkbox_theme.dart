import 'package:fleetgo/resources/colors/colors.dart';
import 'package:flutter/material.dart';

class TCheckboxTheme {
  TCheckboxTheme._();

  static CheckboxThemeData lightCheckBoxTheme = CheckboxThemeData(
    fillColor: WidgetStateProperty.all(TColors.darkgGey),
    checkColor: WidgetStateProperty.all(TColors.liightGrey),
    side: BorderSide.none,
  );
  static CheckboxThemeData darkCheckBoxTheme = CheckboxThemeData(
    fillColor: WidgetStateProperty.all(TColors.liightGrey),
    checkColor: WidgetStateProperty.all(TColors.darkgGey),
    side: BorderSide.none,
  );
}
