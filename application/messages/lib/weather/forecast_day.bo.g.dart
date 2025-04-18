// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_day.bo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastDayBO _$ForecastDayBOFromJson(Map<String, dynamic> json) =>
    ForecastDayBO(
      date: json['date'] as String?,
      day: json['day'] == null
          ? null
          : DayBO.fromJson(json['day'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForecastDayBOToJson(ForecastDayBO instance) =>
    <String, dynamic>{
      'date': instance.date,
      'day': instance.day,
    };
