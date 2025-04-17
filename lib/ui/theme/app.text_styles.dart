import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_weather_forecast/ui/theme/app.colors.dart';

class AppTextStyles {
  static TextStyle appBarTittle = TextStyle(
    fontWeight: FontWeight.w700,
    color: AppColors.appBarTittle,
    fontSize: 30.sp,
  );
  static TextStyle titleSmall = TextStyle(fontWeight: FontWeight.w600, color: AppColors.titleSmall, fontSize: 20.sp);
  static TextStyle hintText = TextStyle(fontWeight: FontWeight.w400, color: AppColors.hintText, fontSize: 17.sp);
  static TextStyle inputText = TextStyle(fontWeight: FontWeight.w400, color: AppColors.inputText, fontSize: 17.sp);
}
