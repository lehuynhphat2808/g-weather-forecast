import 'package:json_annotation/json_annotation.dart';
import 'package:messages/weather/condition.bo.dart';

part 'current.bo.g.dart';

@JsonSerializable()
class CurrentBO {
  @JsonKey(name: 'temp_c')
  final double? tempC;

  @JsonKey(name: 'wind_kph')
  final double? windKph;

  @JsonKey(name: 'humidity')
  final int? humidity;

  @JsonKey(name: 'condition')
  final ConditionBO? condition;

  CurrentBO({
    this.tempC,
    this.windKph,
    this.humidity,
    this.condition,
  });

  factory CurrentBO.fromJson(Map<String, dynamic> json) => _$CurrentBOFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentBOToJson(this);
}
