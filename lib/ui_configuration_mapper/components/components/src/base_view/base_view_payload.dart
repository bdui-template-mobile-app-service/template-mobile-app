import 'package:json_annotation/json_annotation.dart';

import 'package:graduate_work/ui_configuration_mapper/components/core/component_remote_configuration.dart';
import 'package:graduate_work/ui_configuration_mapper/components/models/from_num_or_string.dart';
import 'package:graduate_work/ui_configuration_mapper/components/models/s_edge_insets.dart';
import 'package:collection/collection.dart';

part 'base_view_payload.g.dart';

@JsonSerializable(explicitToJson: true)
class BaseViewPayload extends IComponentRemotePayload {
  String? color;
  @JsonKey(fromJson: optionalFromDoubleOrString, toJson: doubleToJsonWithFill)
  double? width;
  @JsonKey(fromJson: optionalFromDoubleOrString, toJson: doubleToJsonWithFill)
  double? height;
  @JsonKey(fromJson: optionalFromDoubleOrString)
  double? cornerRadius;
  SEdgeInsets? padding;
  SEdgeInsets? margin;
  // final VoidCallback? onTapAction; // Придумать как декодить
  ComponentRemoteConfiguration? child;

  @JsonKey(includeFromJson: false, includeToJson: false)
  Function()? onTapAction;

  BaseViewPayload({
    this.color,
    this.width,
    this.height,
    this.cornerRadius,
    this.padding,
    this.margin,
    // this.onTapAction,
    this.child,
    this.onTapAction,
  });

  factory BaseViewPayload.fromJson(Map<String, dynamic> json) =>
      _$BaseViewPayloadFromJson(json);
  Map<String, dynamic> toJson() => _$BaseViewPayloadToJson(this);

  @override
  List<Object?> get props =>
      [color, width, height, cornerRadius, padding, margin, child];

  @override
  IComponentRemotePayload copyWith({Function()? onTapAction}) {
    return BaseViewPayload(
      color: color,
      width: width,
      height: height,
      cornerRadius: cornerRadius,
      padding: padding,
      margin: margin,
      child: child,
      onTapAction: onTapAction ?? this.onTapAction,
    );
  }

  @override
  List<ComponentRemoteConfiguration> getChildren() =>
      [child].whereNotNull().toList();

  @override
  void setChildren(List<ComponentRemoteConfiguration> children) {
    child = children.firstOrNull;
  }

  @override
  void updateFields(Map<String, dynamic> json) {
    final newFields = BaseViewPayload.fromJson(json);
    color = newFields.color;
    width = newFields.width;
    height = newFields.height;
    cornerRadius = newFields.cornerRadius;
    padding = newFields.padding;
    margin = newFields.margin;
  }
}
