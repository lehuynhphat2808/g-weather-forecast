import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_weather_forecast/gen/fonts.gen.dart';
import 'package:g_weather_forecast/ui/theme/app.color.dart';
import 'package:g_weather_forecast/ui/theme/app.text_styles.dart';

abstract class AppTheme {
  // Light Theme
  static ThemeData lightMode = ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor:  AppColor.appBarBackground, centerTitle: true, titleTextStyle: AppTextStyles.appBarTittle, titleSpacing: 24.h)
      ,fontFamily: FontFamily.rubik,
  textTheme: TextTheme( titleSmall: AppTextStyles.titleSmall,),);

}
