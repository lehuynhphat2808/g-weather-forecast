import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_weather_forecast/ui/dashboard/widget/day_forecast_card.dart';
import 'package:g_weather_forecast/ui/dashboard/widget/present_day.dart' show PresentDay;

class WeatherDetail extends StatelessWidget {
  const WeatherDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 8.h),
        PresentDay(),
        SizedBox(height: 30.h),
        Text(
          AppLocalizations.of(context)?.dashboard_4_day_forecast_tittle ?? '',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 25.h),
        Row(spacing: 16.w, children: List.generate(4, (index) => Expanded(child: DayForecastCard()))),
      ],
    );
  }
}
