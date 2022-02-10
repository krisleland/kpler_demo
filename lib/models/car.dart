import 'package:freezed_annotation/freezed_annotation.dart';

part 'car.g.dart';

@JsonSerializable()
class Car {
  List<String>? signs;
  String? side;

  Car({this.signs, this.side});

  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);

  Map<String, dynamic> toJson() => _$CarToJson(this);
}