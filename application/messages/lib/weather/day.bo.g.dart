// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day.bo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayBO _$DayBOFromJson(Map<String, dynamic> json) => DayBO(
      avgTempC: (json['avgtemp_c'] as num?)?.toDouble(),
      maxWindKph: (json['maxwind_kph'] as num?)?.toDouble(),
      avgHumidity: (json['avghumidity'] as num?)?.toDouble(),
      condition: json['condition'] == null
          ? null
          : ConditionBO.fromJson(json['condition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DayBOToJson(DayBO instance) => <String, dynamic>{
      'avgtemp_c': instance.avgTempC,
      'maxwind_kph': instance.maxWindKph,
      'avghumidity': instance.avgHumidity,
      'condition': instance.condition,
    };
