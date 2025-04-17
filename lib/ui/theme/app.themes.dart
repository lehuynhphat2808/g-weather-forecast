import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_weather_forecast/gen/fonts.gen.dart';
import 'package:g_weather_forecast/ui/theme/app.colors.dart';
import 'package:g_weather_forecast/ui/theme/app.text_styles.dart';

abstract class AppThemes {
  // Light Theme
  static ThemeData lightMode = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.appBarBackground,
      centerTitle: true,
      titleTextStyle: AppTextStyles.appBarTittle,
      titleSpacing: 24.h,
    ),
    fontFamily: FontFamily.rubik,
    textTheme: TextTheme(titleSmall: AppTextStyles.titleSmall),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.textFieldFocusBorderColor, width: 2.0)),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.textFieldBorderColor, width: 1.0)),
      labelStyle: TextStyle(color: AppColors.textFieldFocusBorderColor, fontSize: 16),
      hintStyle: AppTextStyles.hintText,
    ),
  );
}
