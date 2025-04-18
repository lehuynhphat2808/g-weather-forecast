import 'package:json_annotation/json_annotation.dart';
import 'package:messages/abstract.error.response.dart';

part 'send_otp_error.response.g.dart';

@JsonSerializable()
class SendOTPErrorResponse extends AbstractErrorResponse {
  const SendOTPErrorResponse({
    super.title,
    super.status,
    super.detail,
  });

  factory SendOTPErrorResponse.fromJson(Map<String, dynamic> json) => _$SendOTPErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SendOTPErrorResponseToJson(this);
}
