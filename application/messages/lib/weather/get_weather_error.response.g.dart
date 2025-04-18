// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_weather_error.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetWeatherErrorResponse _$GetWeatherErrorResponseFromJson(
        Map<String, dynamic> json) =>
    GetWeatherErrorResponse(
      title: json['title'] as String?,
      status: (json['status'] as num?)?.toInt(),
      detail: json['detail'] as String?,
    );

Map<String, dynamic> _$GetWeatherErrorResponseToJson(
        GetWeatherErrorResponse instance) =>
    <String, dynamic>{
      if (instance.title case final value?) 'title': value,
      if (instance.status case final value?) 'status': value,
      if (instance.detail case final value?) 'detail': value,
    };
