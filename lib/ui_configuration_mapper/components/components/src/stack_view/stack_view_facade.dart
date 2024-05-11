import 'package:flutter/widgets.dart';

import 'stack_view_widget.dart';
import 'stack_view_payload.dart';
import 'package:graduate_work/ui_configuration_mapper/components/core/component_remote_configuration.dart';
import 'package:graduate_work/ui_configuration_mapper/components/core/component_facade.dart';

class StackViewFacade implements ComponentFacade {
  @override
  String componentType() => "Stack";

  @override
  Widget? makeWidgetFromPayload(
    IComponentRemotePayload componentPayload,
    Map<String, dynamic> dataContext,
  ) {
    if (componentPayload is StackViewPayload) {
      return StackViewWidget(
        configurationPayload: componentPayload,
        dataContext: dataContext,
      );
    }
    return null;
  }

  @override
  IComponentRemotePayload? makeDefaultedForCanvas() {
    return StackViewPayload(width: 200, height: 200, color: "000000");
  }

  @override
  IComponentRemotePayload? payloadFromJson(Map<String, dynamic> json) =>
      StackViewPayload.fromJson(json);

  @override
  Map<String, dynamic>? payloadToJson(
      IComponentRemotePayload componentPayload) {
    if (componentPayload is StackViewPayload) {
      return componentPayload.toJson();
    }
    return null;
  }
}
