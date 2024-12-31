import 'package:alpas/utils/theme/custom_themes/appbar_theme.dart';
import 'package:alpas/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:flutter/material.dart';

import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/chip_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/outlined_button_theme.dart';
import 'custom_themes/text_field_theme.dart';
import 'custom_themes/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Plus Jakarta",
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextThemes.lightTextTheme,
    elevatedButtonTheme: ElevatedButtonThemes.lightElevatedButtonTheme,
    appBarTheme: AppbarThemes.lightAppBarTheme,
    bottomSheetTheme: BottomSheetThemes.lightBottomSheetTheme,
    chipTheme: ChipThemes.lightChipTheme,
    outlinedButtonTheme: OutlinedButtonThemes.lightOutlinedButtonTheme,
    checkboxTheme: CheckboxThemes.lightCheckboxTheme,
    inputDecorationTheme: TextFormFieldThemes.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Plus Jakarta",
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TextThemes.darkTextTheme,
    elevatedButtonTheme: ElevatedButtonThemes.darkElevatedButtonTheme,
    appBarTheme: AppbarThemes.darkAppBarTheme,
    bottomSheetTheme: BottomSheetThemes.darkBottomSheetTheme,
    chipTheme: ChipThemes.darkChipTheme,
    outlinedButtonTheme: OutlinedButtonThemes.darkOutlinedButtonTheme,
    checkboxTheme: CheckboxThemes.darkCheckboxTheme,
    inputDecorationTheme: TextFormFieldThemes.darkInputDecorationTheme,
  );
}
