import 'package:json_annotation/json_annotation.dart';

part 'register.request.g.dart';

@JsonSerializable()
class RegisterRequest {
  @JsonKey(name: 'email')
  final String email;

  RegisterRequest({required this.email});

  factory RegisterRequest.fromJson(Map<String, dynamic> json) => _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
