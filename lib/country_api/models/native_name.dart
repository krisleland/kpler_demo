import 'package:freezed_annotation/freezed_annotation.dart';

import 'country_models.dart';

part 'native_name.g.dart';

@JsonSerializable(explicitToJson: true)
class NativeName {
  Swe? swe;

  NativeName({this.swe});

  factory NativeName.fromJson(Map<String, dynamic> json) => _$NativeNameFromJson(json);

  Map<String, dynamic> toJson() => _$NativeNameToJson(this);
}