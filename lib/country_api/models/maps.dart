import 'package:freezed_annotation/freezed_annotation.dart';

part 'maps.g.dart';

@JsonSerializable(explicitToJson: true)
class Maps {
  String? googleMaps;
  String? openStreetMaps;

  Maps({this.googleMaps, this.openStreetMaps});

  factory Maps.fromJson(Map<String, dynamic> json) => _$MapsFromJson(json);

  Map<String, dynamic> toJson() => _$MapsToJson(this);
}