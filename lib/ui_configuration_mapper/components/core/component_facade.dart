import 'package:flutter/widgets.dart';
import 'component_remote_configuration.dart';

/// Входная точка в каждый компонент, которая будет содержать все действия с ним
abstract class ComponentFacade {
  String componentType();

  Widget? makeWidgetFromPayload(
    IComponentRemotePayload componentPayload,
    Map<String, dynamic> dataContext,
  );
  IComponentRemotePayload? makeDefaultedForCanvas();

  // - JSON
  IComponentRemotePayload? payloadFromJson(Map<String, dynamic> json);
  Map<String, dynamic>? payloadToJson(IComponentRemotePayload componentPayload);
}
