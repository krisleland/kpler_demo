import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kpler_map_demo/models/country_models.dart';

part 'currencies.g.dart';

@JsonSerializable()
class Currencies {
  SEK? sEK;

  Currencies({this.sEK});

  factory Currencies.fromJson(Map<String, dynamic> json) => _$CurrenciesFromJson(json);

  Map<String, dynamic> toJson() => _$CurrenciesToJson(this);
}