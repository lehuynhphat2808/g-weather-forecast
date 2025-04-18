// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unsubscribe_error.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnsubscribeErrorResponse _$UnsubscribeErrorResponseFromJson(
        Map<String, dynamic> json) =>
    UnsubscribeErrorResponse(
      title: json['title'] as String?,
      status: (json['status'] as num?)?.toInt(),
      detail: json['detail'] as String?,
    );

Map<String, dynamic> _$UnsubscribeErrorResponseToJson(
        UnsubscribeErrorResponse instance) =>
    <String, dynamic>{
      if (instance.title case final value?) 'title': value,
      if (instance.status case final value?) 'status': value,
      if (instance.detail case final value?) 'detail': value,
    };
