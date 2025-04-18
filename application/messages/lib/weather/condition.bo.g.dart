// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condition.bo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConditionBO _$ConditionBOFromJson(Map<String, dynamic> json) => ConditionBO(
      text: json['text'] as String?,
      icon: json['icon'] as String?,
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ConditionBOToJson(ConditionBO instance) =>
    <String, dynamic>{
      'text': instance.text,
      'icon': instance.icon,
      'code': instance.code,
    };
