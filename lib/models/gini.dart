import 'package:freezed_annotation/freezed_annotation.dart';

part 'gini.g.dart';

@JsonSerializable()
class Gini {
  int? i2018;

  Gini({this.i2018});

  factory Gini.fromJson(Map<String, dynamic> json) => _$GiniFromJson(json);

  Map<String, dynamic> toJson() => _$GiniToJson(this);
}