// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stack_view_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StackViewPayload _$StackViewPayloadFromJson(Map<String, dynamic> json) =>
    StackViewPayload(
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
      axis: $enumDecodeNullable(_$StackViewWidgetAxisEnumMap, json['axis']) ??
          StackViewWidgetAxis.horizontal,
      spacing: json['spacing'] == null
          ? 0
          : optionalFromDoubleOrString(json['spacing']),
      children: (json['children'] as List<dynamic>?)
              ?.map((e) => ComponentRemoteConfiguration.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$StackViewPayloadToJson(StackViewPayload instance) =>
    <String, dynamic>{
      'color': instance.color,
      'width': doubleToJsonWithFill(instance.width),
      'height': doubleToJsonWithFill(instance.height),
      'cornerRadius': instance.cornerRadius,
      'padding': instance.padding?.toJson(),
      'margin': instance.margin?.toJson(),
      'axis': _$StackViewWidgetAxisEnumMap[instance.axis]!,
      'spacing': instance.spacing,
      'children': instance.children.map((e) => e.toJson()).toList(),
    };

const _$StackViewWidgetAxisEnumMap = {
  StackViewWidgetAxis.vertical: 'vertical',
  StackViewWidgetAxis.horizontal: 'horizontal',
};
