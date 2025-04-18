import 'package:json_annotation/json_annotation.dart';

part 'get_weather.request.g.dart';

@JsonSerializable()
class GetWeatherRequest {
  @JsonKey(name: 'locationName')
  final String locationName;

  GetWeatherRequest({required this.locationName});

  factory GetWeatherRequest.fromJson(Map<String, dynamic> json) => _$GetWeatherRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetWeatherRequestToJson(this);
}
