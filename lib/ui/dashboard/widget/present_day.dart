import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_weather_forecast/x_helper/weather_icon_helper.dart';

class PresentDay extends StatelessWidget {
  const PresentDay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 19.h),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.w), color: Theme.of(context).colorScheme.primary),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16.h,
            children: [
              Text('London (2023-06-19)', style: Theme.of(context).textTheme.bodyLarge),
              Text('Temperature: 18.71C', style: Theme.of(context).textTheme.bodyMedium),
              Text('Wind: 4.31  M/S', style: Theme.of(context).textTheme.bodyMedium),
              Text('Humidity: 76%', style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 11.w),
            child: Column(
              children: [
                Image.asset(WeatherIconHelper.getIconPath(1183), width: 70.w, height: 70.w),
                Text('Moderate rain', style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
