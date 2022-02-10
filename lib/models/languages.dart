import 'package:freezed_annotation/freezed_annotation.dart';

part 'languages.g.dart';

@JsonSerializable()
class Languages {
  String? swe;

  Languages({this.swe});

  factory Languages.fromJson(Map<String, dynamic> json) => _$LanguagesFromJson(json);

  Map<String, dynamic> toJson() => _$LanguagesToJson(this);
}
