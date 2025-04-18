part of 'weather_bloc.dart';

abstract class WeatherState {
  const WeatherState();
}

class WeatherInitialState extends WeatherState {}

// --------------------Start Get Weather States-------------------- //

class LoadingGetWeatherState extends WeatherState {}

class ErrorGetWeatherState extends WeatherState {
  final GetWeatherErrorResponse getWeatherErrorResponse;

  ErrorGetWeatherState(this.getWeatherErrorResponse);
}

class SuccessGetWeatherState extends WeatherState {
  final GetWeatherResponse getWeatherResponse;

  SuccessGetWeatherState({required this.getWeatherResponse});
}

// --------------------End Get Weather States-------------------- //
