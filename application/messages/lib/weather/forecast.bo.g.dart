// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast.bo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastBO _$ForecastBOFromJson(Map<String, dynamic> json) => ForecastBO(
      forecastday: (json['forecastday'] as List<dynamic>?)
          ?.map((e) => ForecastDayBO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastBOToJson(ForecastBO instance) =>
    <String, dynamic>{
      'forecastday': instance.forecastday,
    };
