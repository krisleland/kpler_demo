import 'package:freezed_annotation/freezed_annotation.dart';

part 'capital_info.g.dart';

@JsonSerializable(explicitToJson: true)
class CapitalInfo {
  List<double>? latlng;

  CapitalInfo({this.latlng});

  factory CapitalInfo.fromJson(Map<String, dynamic> json) => _$CapitalInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CapitalInfoToJson(this);
}