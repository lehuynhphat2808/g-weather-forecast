import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_weather_forecast/ui/home/page/home.page.dart';
import 'package:g_weather_forecast/ui/theme/app.theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1911, 887),
      builder: (context, child) =>
         MaterialApp(
          debugShowCheckedModeBanner: false,
           theme: AppTheme.lightMode,
           localizationsDelegates: AppLocalizations.localizationsDelegates,
           supportedLocales: AppLocalizations.supportedLocales,
           builder: (context, child) => HomePage(),
        ),
    );
  }
}
