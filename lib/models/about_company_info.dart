import 'dart:ui';

import 'package:graduate_work/styles/src/rgb_color.dart';
import 'package:graduate_work/styles/styles.dart';
import 'package:json_annotation/json_annotation.dart';

part 'about_company_info.g.dart';

@JsonSerializable()
class AboutCompanyInfo {
  final String name;
  final String description;
  final String address;
  @JsonKey(name: 'primary_app_color')
  final String stringPrimaryColor;
  @JsonKey(name: 'logo_image')
  final String logoImage;
  @JsonKey(name: 'link_to_2gis')
  final String linkTo2gis;

  Color get primaryColor => RGBColor.fromHex(stringPrimaryColor);

  AboutCompanyInfo(
    this.name,
    this.description,
    this.address,
    this.stringPrimaryColor,
    this.logoImage,
    this.linkTo2gis,
  );

  factory AboutCompanyInfo.fromJson(Map<String, dynamic> json) =>
      _$AboutCompanyInfoFromJson(json);
  Map<String, dynamic> toJson() => _$AboutCompanyInfoToJson(this);
}
