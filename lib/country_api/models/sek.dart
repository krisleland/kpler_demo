import 'package:freezed_annotation/freezed_annotation.dart';

part 'sek.g.dart';

@JsonSerializable(explicitToJson: true)
class SEK {
  String? name;
  String? symbol;

  SEK({this.name, this.symbol});

  factory SEK.fromJson(Map<String, dynamic> json) => _$SEKFromJson(json);

  Map<String, dynamic> toJson() => _$SEKToJson(this);
}