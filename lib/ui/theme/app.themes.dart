import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_weather_forecast/gen/fonts.gen.dart';
import 'package:g_weather_forecast/ui/theme/app.colors.dart';
import 'package:g_weather_forecast/ui/theme/app.text_styles.dart';

abstract class AppThemes {
  // Light Theme
  static ThemeData lightMode = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      centerTitle: true,
      titleTextStyle: AppTextStyles.appBarTittle,
      titleSpacing: 24.h,
    ),
    scaffoldBackgroundColor: AppColors.backgroundColor,
    fontFamily: FontFamily.rubik,
    textTheme: TextTheme(
      titleSmall: AppTextStyles.titleSmall,
      titleMedium: AppTextStyles.titleMedium,
      bodyLarge: AppTextStyles.bodyLarge,
      bodyMedium: AppTextStyles.bodyMedium,
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.textFieldFocusBorderColor, width: 2.0)),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.textFieldBorderColor, width: 1.0)),
      hintStyle: AppTextStyles.hintText,
    ),
    colorScheme: ColorScheme.light(primary: AppColors.primaryColor, secondary: AppColors.secondaryColor),
    dividerColor: AppColors.divider,
    dividerTheme: DividerThemeData(color: AppColors.divider),
  );
}
