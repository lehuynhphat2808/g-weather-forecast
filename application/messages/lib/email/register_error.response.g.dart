// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_error.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterErrorResponse _$RegisterErrorResponseFromJson(
        Map<String, dynamic> json) =>
    RegisterErrorResponse(
      title: json['title'] as String?,
      status: (json['status'] as num?)?.toInt(),
      detail: json['detail'] as String?,
    );

Map<String, dynamic> _$RegisterErrorResponseToJson(
        RegisterErrorResponse instance) =>
    <String, dynamic>{
      if (instance.title case final value?) 'title': value,
      if (instance.status case final value?) 'status': value,
      if (instance.detail case final value?) 'detail': value,
    };
