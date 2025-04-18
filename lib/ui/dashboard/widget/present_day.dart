import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_weather_forecast/bloc/weather/weather_bloc.dart';
import 'package:g_weather_forecast/x_helper/weather_icon_helper.dart';
import 'package:messages/weather/get_weather.request.dart';

class PresentDay extends StatefulWidget {
  const PresentDay({super.key});

  @override
  State<PresentDay> createState() => _PresentDayState();
}

class _PresentDayState extends State<PresentDay> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(OnGettingWeatherEvent(isLoading: true, GetWeatherRequest(locationName: 'London')));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 19.h),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.w), color: Theme.of(context).colorScheme.primary),
      child: BlocBuilder(
        bloc: context.read<WeatherBloc>(),
        builder: (context, state) {
          if (state is LoadingGetWeatherState) {
            return CircularProgressIndicator(color: Colors.red);
          } else if (state is SuccessGetWeatherState) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16.h,
                  children: [
                    Text(
                      '${state.getWeatherResponse.location?.name} (${state.getWeatherResponse.location?.localtime?.split(' ').first})',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      '${AppLocalizations.of(context)?.dashboard_temp}: ${state.getWeatherResponse.current?.tempC} ${AppLocalizations.of(context)?.dashboard_temp_unit}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      '${AppLocalizations.of(context)?.dashboard_wind}: ${((state.getWeatherResponse.current?.windKph ?? 0) / 3.6).toStringAsFixed(2)}  ${AppLocalizations.of(context)?.dashboard_wind_unit}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      '${AppLocalizations.of(context)?.dashboard_humidity}: ${state.getWeatherResponse.current?.humidity}${AppLocalizations.of(context)?.dashboard_humidity_unit}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: 11.w),
                  child: Column(
                    children: [
                      Image.asset(
                        WeatherIconHelper.getIconPath(state.getWeatherResponse.current?.condition?.code ?? -1),
                        width: 70.w,
                        height: 70.w,
                      ),
                      Text(
                        state.getWeatherResponse.current?.condition?.text ?? '',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Text('${AppLocalizations.of(context)?.dashboard_not_found}');
          }
        },
      ),
    );
  }
}
