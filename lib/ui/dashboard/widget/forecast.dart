import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_weather_forecast/bloc/weather/weather_bloc.dart';
import 'package:g_weather_forecast/ui/dashboard/widget/day_forecast_card.dart';
import 'package:messages/weather/forecast_day.bo.dart';
import 'package:messages/weather/get_weather.request.dart';

class Forecast extends StatefulWidget {
  const Forecast({super.key});

  @override
  State<Forecast> createState() => _ForecastState();
}

class _ForecastState extends State<Forecast> {
  List<ForecastDayBO> forecastDayBOs = [];
  int totalForecastDay = 0;
  final ScrollController _scrollController = ScrollController();

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      _loadMoreData();
    }
  }

  void _loadMoreData() {
    final state = context.read<WeatherBloc>().state;
    if (state is SuccessGetWeatherState) {
      context.read<WeatherBloc>().add(
        OnGettingWeatherEvent(
          GetWeatherRequest(locationName: state.getWeatherResponse.location?.name ?? '', days: totalForecastDay + 4),
          isLoading: false,
        ),
      );
    }
  }

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$totalForecastDay${AppLocalizations.of(context)?.dashboard_day_forecast_tittle}',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 25.h),
        BlocConsumer(
          listener: (context, state) {
            if (state is SuccessGetWeatherState) {
              setState(() {
                forecastDayBOs = state.getWeatherResponse.forecast?.forecastday?.skip(1).toList() ?? [];
                totalForecastDay = forecastDayBOs.length;
              });
            }
          },
          bloc: context.read<WeatherBloc>(),
          builder: (context, state) {
            if (state is LoadingGetWeatherState) {
              return SizedBox(
                height: 185.h,
                width: 790.w,
                child: Center(child: CircularProgressIndicator(color: Theme.of(context).colorScheme.tertiary)),
              );
            } else if (state is SuccessGetWeatherState) {
              return ScrollConfiguration(
                behavior: MaterialScrollBehavior().copyWith(
                  dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
                ),
                child: SingleChildScrollView(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:
                        forecastDayBOs
                            .map(
                              (e) => Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: DayForecastCard(forecastDayBO: e),
                              ),
                            )
                            .toList(),
                  ),
                ),
              );
            } else {
              return Text('${AppLocalizations.of(context)?.dashboard_not_found}');
            }
          },
        ),
      ],
    );
  }
}
