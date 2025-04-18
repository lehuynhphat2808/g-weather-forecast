import 'package:json_annotation/json_annotation.dart';

part 'location.bo.g.dart';

@JsonSerializable()
class LocationBO {
  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'localtime')
  final String? localtime;

  LocationBO({this.name, this.localtime});

  factory LocationBO.fromJson(Map<String, dynamic> json) => _$LocationBOFromJson(json);

  Map<String, dynamic> toJson() => _$LocationBOToJson(this);
}
