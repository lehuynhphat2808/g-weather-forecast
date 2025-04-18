import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_weather_forecast/bloc/weather/weather_bloc.dart';
import 'package:g_weather_forecast/ui/dashboard/widget/forecast.dart';
import 'package:g_weather_forecast/ui/dashboard/widget/present_day.dart' show PresentDay;

class WeatherDetail extends StatefulWidget {
  const WeatherDetail({super.key});

  @override
  State<WeatherDetail> createState() => _WeatherDetailState();
}

class _WeatherDetailState extends State<WeatherDetail> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(OnGettingSavedWeatherEvent(isLoading: true));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [SizedBox(height: 8.h), PresentDay(), SizedBox(height: 30.h), Forecast()],
    );
  }
}
