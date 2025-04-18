import 'package:json_annotation/json_annotation.dart';

part 'send_otp.request.g.dart';

@JsonSerializable()
class SendOTPRequest {
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'otp')
  final String otp;

  SendOTPRequest({required this.email, required this.otp});

  factory SendOTPRequest.fromJson(Map<String, dynamic> json) => _$SendOTPRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SendOTPRequestToJson(this);
}
