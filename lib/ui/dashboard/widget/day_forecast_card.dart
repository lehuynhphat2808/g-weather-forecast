import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_weather_forecast/x_helper/weather_icon_helper.dart';
import 'package:messages/weather/forecast_day.bo.dart';

class DayForecastCard extends StatelessWidget {
  final ForecastDayBO forecastDayBO;

  const DayForecastCard({super.key, required this.forecastDayBO});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(5.w),
      ),
      padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 15.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('(${forecastDayBO.date?.split(' ').first})', style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(height: 18.h),
          Image.asset(WeatherIconHelper.getIconPath(1183), width: 42.w, height: 42.w),
          SizedBox(height: 18.h),
          Text(
            '${AppLocalizations.of(context)?.dashboard_temp}: ${forecastDayBO.day?.avgTempC} ${AppLocalizations.of(context)?.dashboard_temp_unit}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: 13.h),
          Text(
            '${AppLocalizations.of(context)?.dashboard_wind}: ${((forecastDayBO.day?.maxWindKph ?? 0) / 3.6).toStringAsFixed(2)} ${AppLocalizations.of(context)?.dashboard_wind_unit}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: 13.h),
          Text(
            '${AppLocalizations.of(context)?.dashboard_humidity}: ${forecastDayBO.day?.avgHumidity}${AppLocalizations.of(context)?.dashboard_humidity_unit}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
