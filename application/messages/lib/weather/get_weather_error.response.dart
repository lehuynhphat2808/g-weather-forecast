import 'package:json_annotation/json_annotation.dart';
import 'package:messages/abstract.error.response.dart';

part 'get_weather_error.response.g.dart';

@JsonSerializable()
class GetWeatherErrorResponse extends AbstractErrorResponse {
  const GetWeatherErrorResponse({
    super.title,
    super.status,
    super.detail,
  });

  factory GetWeatherErrorResponse.fromJson(Map<String, dynamic> json) => _$GetWeatherErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetWeatherErrorResponseToJson(this);
}
