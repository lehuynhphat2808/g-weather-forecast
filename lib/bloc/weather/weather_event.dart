part of 'weather_bloc.dart';

abstract class WeatherEvent {
  const WeatherEvent();
}

// On Fetching Weather By Location Name Event
class OnGettingWeatherEvent extends WeatherEvent {
  final bool isLoading;
  final GetWeatherRequest getWeatherRequest;

  OnGettingWeatherEvent(this.getWeatherRequest, {this.isLoading = true});
}
