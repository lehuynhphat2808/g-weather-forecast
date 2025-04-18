import 'package:json_annotation/json_annotation.dart';
import 'package:messages/weather/current.bo.dart';
import 'package:messages/weather/forecast.bo.dart';
import 'package:messages/weather/location.bo.dart';

part 'get_weather.response.g.dart';

@JsonSerializable()
class GetWeatherResponse {
  @JsonKey(name: 'location')
  final LocationBO? location;
  @JsonKey(name: 'current')
  final CurrentBO? current;
  @JsonKey(name: 'forecast')
  final ForecastBO? forecast;

  GetWeatherResponse({this.location, this.current, this.forecast});

  factory GetWeatherResponse.fromJson(Map<String, dynamic> json) => _$GetWeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetWeatherResponseToJson(this);
}
