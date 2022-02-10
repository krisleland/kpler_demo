import 'package:freezed_annotation/freezed_annotation.dart';

part 'postal_code.g.dart';

@JsonSerializable(explicitToJson: true)
class PostalCode {
  String? format;
  String? regex;

  PostalCode({this.format, this.regex});

  factory PostalCode.fromJson(Map<String, dynamic> json) => _$PostalCodeFromJson(json);

  Map<String, dynamic> toJson() => _$PostalCodeToJson(this);
}
