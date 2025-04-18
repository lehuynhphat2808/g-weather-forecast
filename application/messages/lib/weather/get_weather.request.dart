import 'package:json_annotation/json_annotation.dart';

part 'get_weather.request.g.dart';

@JsonSerializable()
class GetWeatherRequest {
  @JsonKey(name: 'locationName')
  final String locationName;
  final int? days;

  GetWeatherRequest({required this.locationName, this.days});

  factory GetWeatherRequest.fromJson(Map<String, dynamic> json) => _$GetWeatherRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetWeatherRequestToJson(this);
}
