import 'package:freezed_annotation/freezed_annotation.dart';

part 'idd.g.dart';

@JsonSerializable()
class Idd {
  String? root;
  List<String>? suffixes;

  Idd({this.root, this.suffixes});

  factory Idd.fromJson(Map<String, dynamic> json) => _$IddFromJson(json);

  Map<String, dynamic> toJson() => _$IddToJson(this);
}