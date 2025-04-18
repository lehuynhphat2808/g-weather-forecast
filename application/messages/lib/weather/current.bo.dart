import 'package:json_annotation/json_annotation.dart';
import 'package:messages/weather/condition.bo.dart';

part 'current.bo.g.dart';

@JsonSerializable()
class CurrentBO {
  @JsonKey(name: 'last_updated_epoch')
  final int? lastUpdatedEpoch;
  @JsonKey(name: 'last_updated')
  final String? lastUpdated;
  @JsonKey(name: 'temp_c')
  final double? tempC;
  @JsonKey(name: 'temp_f')
  final double? tempF;
  @JsonKey(name: 'is_day')
  final int? isDay;
  @JsonKey(name: 'condition')
  final ConditionBO? condition;
  @JsonKey(name: 'wind_mph')
  final int? windMph;
  @JsonKey(name: 'wind_kph')
  final double? windKph;
  @JsonKey(name: 'wind_degree')
  final int? windDegree;
  @JsonKey(name: 'wind_dir')
  final String? windDir;
  @JsonKey(name: 'pressure_mb')
  final int? pressureMb;
  @JsonKey(name: 'pressure_in')
  final double? pressureIn;
  @JsonKey(name: 'precip_mm')
  final int? precipMm;
  @JsonKey(name: 'precip_in')
  final int? precipIn;
  @JsonKey(name: 'humidity')
  final int? humidity;
  @JsonKey(name: 'cloud')
  final int? cloud;
  @JsonKey(name: 'feelslike_c')
  final double? feelslikeC;
  @JsonKey(name: 'feelslike_f')
  final double? feelslikeF;
  @JsonKey(name: 'windchill_c')
  final double? windchillC;
  @JsonKey(name: 'windchill_f')
  final int? windchillF;
  @JsonKey(name: 'heatindex_c')
  final double? heatindexC;
  @JsonKey(name: 'heatindex_f')
  final double? heatindexF;
  @JsonKey(name: 'dewpoint_c')
  final double? dewpointC;
  @JsonKey(name: 'dewpoint_f')
  final double? dewpointF;
  @JsonKey(name: 'vis_km')
  final int? visKm;
  @JsonKey(name: 'vis_miles')
  final int? visMiles;
  @JsonKey(name: 'uv')
  final int? uv;
  @JsonKey(name: 'gust_mph')
  final double? gustMph;
  @JsonKey(name: 'gust_kph')
  final double? gustKph;

  CurrentBO({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.windchillC,
    this.windchillF,
    this.heatindexC,
    this.heatindexF,
    this.dewpointC,
    this.dewpointF,
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
  });

  factory CurrentBO.fromJson(Map<String, dynamic> json) => _$CurrentBOFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CurrentBOToJson(this);
}
