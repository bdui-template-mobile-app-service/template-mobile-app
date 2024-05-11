import 'package:flutter/widgets.dart';

import 'package:graduate_work/ui_configuration_mapper/components/core/component_remote_configuration.dart';
import 'package:graduate_work/ui_configuration_mapper/components/core/component_facade.dart';

import 'image_view_payload.dart';
import 'image_view_widget.dart';

class ImageViewFacade implements ComponentFacade {
  @override
  String componentType() => "Image";

  @override
  Widget? makeWidgetFromPayload(
    IComponentRemotePayload componentPayload,
    Map<String, dynamic> dataContext,
  ) {
    if (componentPayload is ImageViewPayload) {
      return ImageViewWidget(
        configurationPayload: componentPayload,
        dataContext: dataContext,
      );
    }
    return null;
  }

  @override
  IComponentRemotePayload? makeDefaultedForCanvas() {
    return ImageViewPayload(width: 200, height: 200, color: "000000");
  }

  @override
  IComponentRemotePayload? payloadFromJson(Map<String, dynamic> json) =>
      ImageViewPayload.fromJson(json);

  @override
  Map<String, dynamic>? payloadToJson(
      IComponentRemotePayload componentPayload) {
    if (componentPayload is ImageViewPayload) {
      return componentPayload.toJson();
    }
    return null;
  }
}
