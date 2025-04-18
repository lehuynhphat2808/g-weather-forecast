import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_weather_forecast/ui/dashboard/widget/search_form.dart';
import 'package:g_weather_forecast/ui/dashboard/widget/weather_detail.dart';

class DashBoardMobilePage extends StatelessWidget {
  const DashBoardMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)?.dashboard_app_bar_tittle ?? '')),
      body: Container(
        padding: EdgeInsets.only(top: 16.h, left: 8.w, right: 8.w),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [SearchForm(), SizedBox(width: 39.w), WeatherDetail()],
          ),
        ),
      ),
    );
  }
}
