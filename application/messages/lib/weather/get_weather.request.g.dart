// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_weather.request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetWeatherRequest _$GetWeatherRequestFromJson(Map<String, dynamic> json) =>
    GetWeatherRequest(
      locationName: json['locationName'] as String,
      days: (json['days'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GetWeatherRequestToJson(GetWeatherRequest instance) =>
    <String, dynamic>{
      'locationName': instance.locationName,
      'days': instance.days,
    };
