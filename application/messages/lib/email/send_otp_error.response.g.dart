// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_otp_error.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendOTPErrorResponse _$SendOTPErrorResponseFromJson(
        Map<String, dynamic> json) =>
    SendOTPErrorResponse(
      title: json['title'] as String?,
      status: (json['status'] as num?)?.toInt(),
      detail: json['detail'] as String?,
    );

Map<String, dynamic> _$SendOTPErrorResponseToJson(
        SendOTPErrorResponse instance) =>
    <String, dynamic>{
      if (instance.title case final value?) 'title': value,
      if (instance.status case final value?) 'status': value,
      if (instance.detail case final value?) 'detail': value,
    };
