import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_weather_forecast/x_helper/weather_icon_helper.dart';

class DayForecastCard extends StatelessWidget {
  const DayForecastCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(5.w),
      ),
      padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('(2023-06-20)', style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(height: 18.h),
          Image.asset(WeatherIconHelper.getIconPath(1183), width: 42.w, height: 42.w),
          SizedBox(height: 18.h),
          Text('Temp:17.64°C', style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(height: 13.h),
          Text('Wind: 0.73 M/S', style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(height: 13.h),
          Text('Humidity: 70%', style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
