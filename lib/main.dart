import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_weather_forecast/ui/home/page/home.page.dart';
import 'package:g_weather_forecast/ui/theme/app.theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1911, 887),
      minTextAdapt: true,
      builder: (context, child) =>
         MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightMode,
          builder: (context, child) => HomePage(),
        ),
    );
  }
}
