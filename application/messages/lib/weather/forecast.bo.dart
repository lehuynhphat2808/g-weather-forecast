import 'package:json_annotation/json_annotation.dart';
import 'package:messages/weather/forecast_day.bo.dart';

part 'forecast.bo.g.dart';

@JsonSerializable()
class ForecastBO {
  @JsonKey(name: 'forecastday')
  final List<ForecastDayBO>? forecastday;

  ForecastBO({this.forecastday});

  factory ForecastBO.fromJson(Map<String, dynamic> json) => _$ForecastBOFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastBOToJson(this);
}
