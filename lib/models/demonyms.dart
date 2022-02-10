import 'package:freezed_annotation/freezed_annotation.dart';

import 'country_models.dart';

part 'demonyms.g.dart';

@JsonSerializable()
class Demonyms {
  Eng? eng;
  Eng? fra;

  Demonyms({this.eng, this.fra});

  factory Demonyms.fromJson(Map<String, dynamic> json) => _$DemonymsFromJson(json);

  Map<String, dynamic> toJson() => _$DemonymsToJson(this);
}