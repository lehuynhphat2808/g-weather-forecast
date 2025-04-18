import 'package:json_annotation/json_annotation.dart';
import 'package:messages/weather/condition.bo.dart';

part 'day.bo.g.dart';

@JsonSerializable()
class DayBO {
  @JsonKey(name: 'avgtemp_c')
  final double? avgTempC;

  @JsonKey(name: 'maxwind_kph')
  final double? maxWindKph;

  @JsonKey(name: 'avghumidity')
  final double? avgHumidity;

  @JsonKey(name: 'condition')
  final ConditionBO? condition;

  DayBO({
    this.avgTempC,
    this.maxWindKph,
    this.avgHumidity,
    this.condition,
  });

  factory DayBO.fromJson(Map<String, dynamic> json) => _$DayBOFromJson(json);

  Map<String, dynamic> toJson() => _$DayBOToJson(this);
}
