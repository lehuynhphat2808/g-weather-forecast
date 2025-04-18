import 'package:json_annotation/json_annotation.dart';
import 'package:messages/weather/day.bo.dart';

part 'forecast_day.bo.g.dart';

@JsonSerializable()
class ForecastDayBO {
  @JsonKey(name: 'date')
  final String? date;

  @JsonKey(name: 'day')
  final DayBO? day;

  ForecastDayBO({
    this.date,
    this.day,
  });

  factory ForecastDayBO.fromJson(Map<String, dynamic> json) => _$ForecastDayBOFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastDayBOToJson(this);
}
