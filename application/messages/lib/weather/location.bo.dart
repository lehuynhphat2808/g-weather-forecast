import 'package:json_annotation/json_annotation.dart';

part 'location.bo.g.dart';

@JsonSerializable()
class LocationBO {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'region')
  final String? region;
  @JsonKey(name: 'country')
  final String? country;
  @JsonKey(name: 'lat')
  final double? lat;
  @JsonKey(name: 'lon')
  final double? lon;
  @JsonKey(name: 'tz_id')
  final String? tzId;
  @JsonKey(name: 'localtime_epoch')
  final int? localtimeEpoch;
  @JsonKey(name: 'localtime')
  final String? localtime;

  LocationBO({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });

  factory LocationBO.fromJson(Map<String, dynamic> json) => _$LocationBOFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LocationBOToJson(this);
}
