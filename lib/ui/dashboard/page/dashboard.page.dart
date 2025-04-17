import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_weather_forecast/ui/dashboard/widget/search_form.dart';
import 'package:g_weather_forecast/ui/dashboard/widget/weather_detail.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)?.dashboard_app_bar_tittle ?? '')),
      body: Padding(
        padding: EdgeInsets.only(top: 44.h, left: 34.w, right: 34.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 383.w, child: SearchForm()),
            SizedBox(width: 39.w),
            Expanded(child: WeatherDetail()),
          ],
        ),
      ),
    );
  }
}
