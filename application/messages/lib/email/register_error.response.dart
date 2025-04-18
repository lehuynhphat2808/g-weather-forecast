import 'package:json_annotation/json_annotation.dart';
import 'package:messages/abstract.error.response.dart';

part 'register_error.response.g.dart';

@JsonSerializable()
class RegisterErrorResponse extends AbstractErrorResponse {
  const RegisterErrorResponse({
    super.title,
    super.status,
    super.detail,
  });

  factory RegisterErrorResponse.fromJson(Map<String, dynamic> json) => _$RegisterErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterErrorResponseToJson(this);
}
