import 'package:json_annotation/json_annotation.dart';

import 'package:graduate_work/ui_configuration_mapper/components/components/base_view.dart';
import 'package:graduate_work/ui_configuration_mapper/components/core/component_remote_configuration.dart';
import 'package:graduate_work/ui_configuration_mapper/components/models/from_num_or_string.dart';
import 'package:graduate_work/ui_configuration_mapper/components/models/s_edge_insets.dart';

part 'stack_view_payload.g.dart';

enum StackViewWidgetAxis { vertical, horizontal }

@JsonSerializable(explicitToJson: true)
class StackViewPayload extends BaseViewPayload {
  StackViewWidgetAxis axis;
  // TODO: Задействовать это
  @JsonKey(fromJson: optionalFromDoubleOrString)
  double? spacing;
  // final alignment;
  List<ComponentRemoteConfiguration> children;

  @JsonKey(includeFromJson: false, includeToJson: false)
  Function()? onTapAction;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  ComponentRemoteConfiguration? child;

  StackViewPayload({
    String? color,
    double? width,
    double? height,
    double? cornerRadius,
    SEdgeInsets? padding,
    SEdgeInsets? margin,
    // VoidCallback? onTapAction,
    this.axis = StackViewWidgetAxis.horizontal,
    this.spacing = 0,
    this.children = const [],
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

  factory StackViewPayload.fromJson(Map<String, dynamic> json) =>
      _$StackViewPayloadFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StackViewPayloadToJson(this);

  @override
  List<Object?> get props => super.props..addAll([axis, spacing, children]);

  @override
  IComponentRemotePayload copyWith({Function()? onTapAction}) {
    return StackViewPayload(
      color: color,
      width: width,
      height: height,
      cornerRadius: cornerRadius,
      padding: padding,
      margin: margin,
      axis: axis,
      spacing: spacing,
      children: children,
      onTapAction: onTapAction ?? this.onTapAction,
    );
  }

  @override
  List<ComponentRemoteConfiguration> getChildren() => children;

  @override
  void setChildren(List<ComponentRemoteConfiguration> children) {
    this.children = children;
  }

  @override
  void updateFields(Map<String, dynamic> json) {
    super.updateFields(json);
    final newFields = StackViewPayload.fromJson(json);
    axis = newFields.axis;
    spacing = newFields.spacing;
  }
}
