import 'package:freezed_annotation/freezed_annotation.dart';

part 'eng.g.dart';

@JsonSerializable()
class Eng {
  String? f;
  String? m;

  Eng({this.f, this.m});

  factory Eng.fromJson(Map<String, dynamic> json) => _$EngFromJson(json);

  Map<String, dynamic>toJson() => _$EngToJson(this);
}