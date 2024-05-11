// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_view_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageViewPayload _$ImageViewPayloadFromJson(Map<String, dynamic> json) =>
    ImageViewPayload(
      color: json['color'] as String?,
      width: optionalFromDoubleOrString(json['width']),
      height: optionalFromDoubleOrString(json['height']),
      cornerRadius: optionalFromDoubleOrString(json['cornerRadius']),
      padding: json['padding'] == null
          ? null
          : SEdgeInsets.fromJson(json['padding'] as String),
      margin: json['margin'] == null
          ? null
          : SEdgeInsets.fromJson(json['margin'] as String),
      url: json['url'] as String?,
      urlSource: json['urlSource'] as String?,
    )..child = json['child'] == null
        ? null
        : ComponentRemoteConfiguration.fromJson(
            json['child'] as Map<String, dynamic>);

Map<String, dynamic> _$ImageViewPayloadToJson(ImageViewPayload instance) =>
    <String, dynamic>{
      'color': instance.color,
      'width': doubleToJsonWithFill(instance.width),
      'height': doubleToJsonWithFill(instance.height),
      'cornerRadius': instance.cornerRadius,
      'padding': instance.padding?.toJson(),
      'margin': instance.margin?.toJson(),
      'child': instance.child?.toJson(),
      'url': instance.url,
      'urlSource': instance.urlSource,
    };
