// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_company_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AboutCompanyInfo _$AboutCompanyInfoFromJson(Map<String, dynamic> json) =>
    AboutCompanyInfo(
      json['name'] as String,
      json['description'] as String,
      json['address'] as String,
      json['primary_app_color'] as String,
      json['logo_image'] as String,
      json['link_to_2gis'] as String,
    );

Map<String, dynamic> _$AboutCompanyInfoToJson(AboutCompanyInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'address': instance.address,
      'primary_app_color': instance.stringPrimaryColor,
      'logo_image': instance.logoImage,
      'link_to_2gis': instance.linkTo2gis,
    };
