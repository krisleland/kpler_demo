// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currencies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Currencies _$CurrenciesFromJson(Map<String, dynamic> json) => Currencies(
      sEK: json['sEK'] == null
          ? null
          : SEK.fromJson(json['sEK'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrenciesToJson(Currencies instance) =>
    <String, dynamic>{
      'sEK': instance.sEK?.toJson(),
    };
