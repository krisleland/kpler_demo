import 'package:freezed_annotation/freezed_annotation.dart';

part 'swe.g.dart';

@JsonSerializable()
class Swe {
  String? official;
  String? common;

  Swe({this.official, this.common});

  factory Swe.fromJson(Map<String, dynamic> json) => _$SweFromJson(json);

  Map<String, dynamic> toJson() => _$SweToJson(this);
}