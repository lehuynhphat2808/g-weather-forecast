import 'package:json_annotation/json_annotation.dart';

part 'bo.base.g.dart';

@JsonSerializable()
class BOBase {
  @JsonKey(name: 'id')
  final String? id;

  const BOBase({this.id});

  factory BOBase.fromJson(Map<String, dynamic> json) => _$BOBaseFromJson(json);

  Map<String, dynamic> toJson() => _$BOBaseToJson(this);

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is BOBase && runtimeType == other.runtimeType && id == other.id;
  }

  @override
  @override
  int get hashCode => id?.hashCode ?? 0;
}
