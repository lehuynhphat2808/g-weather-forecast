import 'package:flutter/material.dart';
import 'package:g_weather_forecast/ui/dashboard/widget/present_day.dart';

class WeatherDetail extends StatelessWidget {
  const WeatherDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [PresentDay()]);
  }
}
