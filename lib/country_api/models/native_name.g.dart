// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'native_name.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NativeName _$NativeNameFromJson(Map<String, dynamic> json) => NativeName(
      swe: json['swe'] == null
          ? null
          : Swe.fromJson(json['swe'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NativeNameToJson(NativeName instance) =>
    <String, dynamic>{
      'swe': instance.swe?.toJson(),
    };
