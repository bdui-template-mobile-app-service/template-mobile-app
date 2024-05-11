import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';

import 'package:graduate_work/ui_configuration_mapper/components/models/s_edge_insets.dart';
import 'package:graduate_work/ui_configuration_mapper/components/components/base_view.dart';

import '../../../core/component_remote_configuration.dart';
import '../../../models/from_num_or_string.dart';

part 'image_view_payload.g.dart';

@JsonSerializable(explicitToJson: true)
class ImageViewPayload extends BaseViewPayload {
  /// Что-то одно из нижнего должно быть не null
  String? url;
  String? urlSource;

  ImageViewPayload({
    String? color,
    double? width,
    double? height,
    double? cornerRadius,
    SEdgeInsets? padding,
    SEdgeInsets? margin,
    VoidCallback? onTapAction,
    this.url,
    this.urlSource,
  }) : super(
          color: color,
          width: width,
          height: height,
          cornerRadius: cornerRadius,
          padding: padding,
          margin: margin,
          child: null,
          onTapAction: onTapAction,
        );

  factory ImageViewPayload.fromJson(Map<String, dynamic> json) =>
      _$ImageViewPayloadFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ImageViewPayloadToJson(this);

  @override
  List<Object?> get props => super.props..addAll([url, urlSource]);

  @override
  IComponentRemotePayload copyWith({Function()? onTapAction}) {
    return ImageViewPayload(
      color: color,
      width: width,
      height: height,
      cornerRadius: cornerRadius,
      padding: padding,
      margin: margin,
      url: url,
      urlSource: urlSource,
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
    final newFields = ImageViewPayload.fromJson(json);
    url = newFields.url;
    urlSource = newFields.urlSource;
  }
}
