// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_weather.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetWeatherResponse _$GetWeatherResponseFromJson(Map<String, dynamic> json) =>
    GetWeatherResponse(
      location: json['location'] == null
          ? null
          : LocationBO.fromJson(json['location'] as Map<String, dynamic>),
      current: json['current'] == null
          ? null
          : CurrentBO.fromJson(json['current'] as Map<String, dynamic>),
      forecast: json['forecast'] == null
          ? null
          : ForecastBO.fromJson(json['forecast'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetWeatherResponseToJson(GetWeatherResponse instance) =>
    <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
      'forecast': instance.forecast,
    };
