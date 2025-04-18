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

// On Fetching Weather By Saved Data
class OnGettingSavedWeatherEvent extends WeatherEvent {
  final bool isLoading;

  OnGettingSavedWeatherEvent({this.isLoading = true});
}
