import 'package:json_annotation/json_annotation.dart';

abstract class AbstractErrorResponse {
  @JsonKey(name: 'title', includeIfNull: false)
  final String? title;

  @JsonKey(name: 'status', includeIfNull: false)
  final int? status;

  @JsonKey(name: 'detail', includeIfNull: false)
  final String? detail;

  const AbstractErrorResponse({this.title, this.status, this.detail});

  bool get isUnauthorized => status == 401;

  bool get isForbidden => status == 403;

  bool get isBadRequest => status == 400;

  String get errorMessage => detail ?? 'Unknown error';

  int get statusCode => status ?? 500;
}
