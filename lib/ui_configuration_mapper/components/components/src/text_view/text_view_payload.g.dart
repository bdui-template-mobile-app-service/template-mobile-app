// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_view_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextViewPayload _$TextViewPayloadFromJson(Map<String, dynamic> json) =>
    TextViewPayload(
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
      text: json['text'] as String?,
      textSource: json['textSource'] as String?,
      textAlign: $enumDecodeNullable(_$TextAlignEnumMap, json['textAlign']),
      textColor: json['textColor'] as String? ?? "#000000",
      textSize:
          json['textSize'] == null ? 16 : fromDoubleOrString(json['textSize']),
      isBold: json['isBold'] as bool? ?? false,
    )..child = json['child'] == null
        ? null
        : ComponentRemoteConfiguration.fromJson(
            json['child'] as Map<String, dynamic>);

Map<String, dynamic> _$TextViewPayloadToJson(TextViewPayload instance) =>
    <String, dynamic>{
      'color': instance.color,
      'width': doubleToJsonWithFill(instance.width),
      'height': doubleToJsonWithFill(instance.height),
      'cornerRadius': instance.cornerRadius,
      'padding': instance.padding?.toJson(),
      'margin': instance.margin?.toJson(),
      'child': instance.child?.toJson(),
      'text': instance.text,
      'textSource': instance.textSource,
      'textAlign': _$TextAlignEnumMap[instance.textAlign],
      'textColor': instance.textColor,
      'textSize': instance.textSize,
      'isBold': instance.isBold,
    };

const _$TextAlignEnumMap = {
  TextAlign.left: 'left',
  TextAlign.right: 'right',
  TextAlign.center: 'center',
  TextAlign.justify: 'justify',
  TextAlign.start: 'start',
  TextAlign.end: 'end',
};
