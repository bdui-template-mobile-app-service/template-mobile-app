import 'package:flutter/widgets.dart';

import 'package:graduate_work/ui_configuration_mapper/components/core/component_remote_configuration.dart';
import 'package:graduate_work/ui_configuration_mapper/components/core/component_facade.dart';

import 'text_view_widget.dart';
import 'text_view_payload.dart';

class TextViewFacade implements ComponentFacade {
  @override
  String componentType() => "Text";

  @override
  Widget? makeWidgetFromPayload(
    IComponentRemotePayload componentPayload,
    Map<String, dynamic> dataContext,
  ) {
    if (componentPayload is TextViewPayload) {
      return TextViewWidget(
        configurationPayload: componentPayload,
        dataContext: dataContext,
      );
    }
    return null;
  }

  @override
  IComponentRemotePayload? makeDefaultedForCanvas() {
    return TextViewPayload(width: 200, height: 200, color: "000000");
  }

  @override
  IComponentRemotePayload? payloadFromJson(Map<String, dynamic> json) =>
      TextViewPayload.fromJson(json);

  @override
  Map<String, dynamic>? payloadToJson(
      IComponentRemotePayload componentPayload) {
    if (componentPayload is TextViewPayload) {
      return componentPayload.toJson();
    }
    return null;
  }
}
