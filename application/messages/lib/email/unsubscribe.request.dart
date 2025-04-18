import 'package:json_annotation/json_annotation.dart';

part 'unsubscribe.request.g.dart';

@JsonSerializable()
class UnsubscribeRequest {
  @JsonKey(name: 'email')
  final String email;

  UnsubscribeRequest({required this.email});

  factory UnsubscribeRequest.fromJson(Map<String, dynamic> json) => _$UnsubscribeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UnsubscribeRequestToJson(this);
}
