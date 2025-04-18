import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_weather_forecast/bloc/weather/weather_bloc.dart';
import 'package:g_weather_forecast/di_locator.dart';
import 'package:g_weather_forecast/ui/dashboard/page/dashboard.page.dart';
import 'package:g_weather_forecast/ui/theme/app.themes.dart';

import 'bloc/email/email_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();

  configureDependencies();
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (context) => WeatherBloc()), BlocProvider(create: (context) => EmailBloc())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1280, 720),
      builder:
          (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppThemes.lightMode,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const DashBoardPage(),
          ),
    );
  }
}
