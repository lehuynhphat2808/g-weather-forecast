// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_otp.request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendOTPRequest _$SendOTPRequestFromJson(Map<String, dynamic> json) =>
    SendOTPRequest(
      email: json['email'] as String,
      otp: json['otp'] as String,
    );

Map<String, dynamic> _$SendOTPRequestToJson(SendOTPRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'otp': instance.otp,
    };
