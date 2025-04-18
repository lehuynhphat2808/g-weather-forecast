import 'package:json_annotation/json_annotation.dart';
import 'package:messages/abstract.error.response.dart';

part 'unsubscribe_error.response.g.dart';

@JsonSerializable()
class UnsubscribeErrorResponse extends AbstractErrorResponse {
  const UnsubscribeErrorResponse({
    super.title,
    super.status,
    super.detail,
  });

  factory UnsubscribeErrorResponse.fromJson(Map<String, dynamic> json) => _$UnsubscribeErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UnsubscribeErrorResponseToJson(this);
}
