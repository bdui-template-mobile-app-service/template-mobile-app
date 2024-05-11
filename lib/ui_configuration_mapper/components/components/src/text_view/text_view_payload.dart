import 'dart:ui';
import 'package:json_annotation/json_annotation.dart';

import 'package:graduate_work/ui_configuration_mapper/components/models/from_num_or_string.dart';
import 'package:graduate_work/ui_configuration_mapper/components/models/s_edge_insets.dart';
import 'package:graduate_work/ui_configuration_mapper/components/components/base_view.dart';
import 'package:collection/collection.dart';

import '../../../core/component_remote_configuration.dart';

part 'text_view_payload.g.dart';

@JsonSerializable(explicitToJson: true)
class TextViewPayload extends BaseViewPayload {
  /// Что-то одно из нижнего должно быть не null
  String? text;
  String? textSource;

  TextAlign? textAlign;

  String textColor;
  @JsonKey(fromJson: fromDoubleOrString)
  double textSize;
  bool isBold;

  @JsonKey(includeFromJson: false, includeToJson: false)
  Function()? onTapAction;

  TextViewPayload({
    String? color,
    double? width,
    double? height,
    double? cornerRadius,
    SEdgeInsets? padding,
    SEdgeInsets? margin,
    // VoidCallback? onTapAction,
    this.text,
    this.textSource,
    this.textAlign,
    this.textColor = "#000000",
    this.textSize = 16,
    this.isBold = false,
    this.onTapAction,
  }) : super(
          color: color,
          width: width,
          height: height,
          cornerRadius: cornerRadius,
          padding: padding,
          margin: margin,
          // onTapAction: onTapAction,
          child: null,
          onTapAction: onTapAction,
        );

  factory TextViewPayload.fromJson(Map<String, dynamic> json) =>
      _$TextViewPayloadFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TextViewPayloadToJson(this);

  @override
  List<Object?> get props => super.props
    ..addAll([text, textSource, textAlign, textColor, textSize, isBold]);

  @override
  IComponentRemotePayload copyWith({Function()? onTapAction}) {
    return TextViewPayload(
      color: color,
      width: width,
      height: height,
      cornerRadius: cornerRadius,
      padding: padding,
      margin: margin,
      text: text,
      textSource: textSource,
      textAlign: textAlign,
      textColor: textColor,
      textSize: textSize,
      isBold: isBold,
      onTapAction: onTapAction ?? this.onTapAction,
    );
  }

  @override
  List<ComponentRemoteConfiguration> getChildren() => [];

  @override
  void setChildren(List<ComponentRemoteConfiguration> children) {}

  @override
  void updateFields(Map<String, dynamic> json) {
    super.updateFields(json);
    final newFields = TextViewPayload.fromJson(json);
    text = newFields.text;
    textSource = newFields.textSource;
    textAlign = newFields.textAlign;
    textColor = newFields.textColor;
    textSize = newFields.textSize;
    isBold = newFields.isBold;
  }
}
