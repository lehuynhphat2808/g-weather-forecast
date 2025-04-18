// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current.bo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentBO _$CurrentBOFromJson(Map<String, dynamic> json) => CurrentBO(
      tempC: (json['temp_c'] as num?)?.toDouble(),
      windKph: (json['wind_kph'] as num?)?.toDouble(),
      humidity: (json['humidity'] as num?)?.toInt(),
      condition: json['condition'] == null
          ? null
          : ConditionBO.fromJson(json['condition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrentBOToJson(CurrentBO instance) => <String, dynamic>{
      'temp_c': instance.tempC,
      'wind_kph': instance.windKph,
      'humidity': instance.humidity,
      'condition': instance.condition,
    };
