import 'package:json_annotation/json_annotation.dart';

part 'condition.bo.g.dart';

@JsonSerializable()
class ConditionBO {
  @JsonKey(name: 'text')
  final String? text;
  @JsonKey(name: 'icon')
  final String? icon;
  @JsonKey(name: 'code')
  final int? code;

  ConditionBO({
    this.text,
    this.icon,
    this.code,
  });

  factory ConditionBO.fromJson(Map<String, dynamic> json) => _$ConditionBOFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ConditionBOToJson(this);
}
