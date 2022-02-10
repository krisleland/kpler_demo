import 'package:freezed_annotation/freezed_annotation.dart';

import 'country_models.dart';

part 'translations.g.dart';

@JsonSerializable(explicitToJson: true)
class Translations {
  Swe? ara;
  Swe? ces;
  Swe? cym;
  Swe? deu;
  Swe? est;
  Swe? fin;
  Eng? fra;
  Swe? hrv;
  Swe? hun;
  Swe? ita;
  Swe? jpn;
  Swe? kor;
  Swe? nld;
  Swe? per;
  Swe? pol;
  Swe? por;
  Swe? rus;
  Swe? slk;
  Swe? spa;
  Swe? swe;
  Swe? urd;
  Swe? zho;

  Translations(
      {this.ara,
        this.ces,
        this.cym,
        this.deu,
        this.est,
        this.fin,
        this.fra,
        this.hrv,
        this.hun,
        this.ita,
        this.jpn,
        this.kor,
        this.nld,
        this.per,
        this.pol,
        this.por,
        this.rus,
        this.slk,
        this.spa,
        this.swe,
        this.urd,
        this.zho});

  factory Translations.fromJson(Map<String, dynamic> json) => _$TranslationsFromJson(json);

  Map<String, dynamic> toJson() => _$TranslationsToJson(this);
}