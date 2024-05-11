import 'package:flutter/widgets.dart';
import 'package:graduate_work/ui_configuration_mapper/components/components/base_view.dart';
import 'package:graduate_work/ui_configuration_mapper/components/components/image_view.dart';
import 'package:graduate_work/ui_configuration_mapper/components/components/stack_view.dart';
import 'package:graduate_work/ui_configuration_mapper/components/components/text_view.dart';
import 'package:graduate_work/ui_configuration_mapper/components/core/component_remote_configuration.dart';
import 'package:collection/collection.dart';
import 'package:graduate_work/ui_configuration_mapper/components/core/component_facade.dart';
import 'package:graduate_work/ui_configuration_mapper/components/core/prepentation/prepared_to_canvas_component_remote_configuration.dart';

class ComponentsFactory {
  static final List<ComponentFacade> allComponents = [
    BaseViewWidget.facade,
    StackViewWidget.facade,
    TextViewWidget.facade,
    ImageViewWidget.facade,
  ];

  static Widget? makeComponentFromJson(
    Map<String, dynamic> json,
    Map<String, dynamic> dataContext,
  ) {
    final layout = json['layout'];
    mapChangeStringNULLToNull(layout);
    final config = ComponentRemoteConfiguration.fromJson(layout);
    return makeComponentFrom(config, dataContext);
  }

  static Widget? makeComponentFrom(
    ComponentRemoteConfiguration config,
    Map<String, dynamic> dataContext,
  ) {
    final componentFacade = getComponentFacade(config.componentType);

    if (componentFacade == null) {
      print("ComponentType and ComponentPayload is not matching");
      return null;
    }

    return componentFacade.makeWidgetFromPayload(
      config.componentPayload,
      dataContext,
    );
  }

  static ComponentRemoteConfiguration? makeRemoteConfigurationFrom(
    Map<String, dynamic> json,
  ) {
    final type = json['type'].toString();

    final componentFacade = getComponentFacade(type);
    if (componentFacade == null) {
      print("ComponentType and ComponentPayload is not matching");
      return null;
    }

    final payload = componentFacade.payloadFromJson(json);
    if (payload == null) {
      print("ComponentType and ComponentPayload is not matching");
      return null;
    }

    return ComponentRemoteConfiguration(type, payload);
  }

  static ComponentRemoteConfiguration? makeDefaultedRemoteConfiguration(
      String type) {
    final componentFacade = getComponentFacade(type);

    if (componentFacade == null) {
      print("ComponentType and ComponentPayload is not matching");
      return null;
    }

    final componentPayload = componentFacade.makeDefaultedForCanvas();
    if (componentPayload == null) {
      print("ComponentType and ComponentPayload is not matching");
      return null;
    }

    return ComponentRemoteConfiguration(
      type,
      componentPayload,
    );
  }

  static Map<String, dynamic>? toJson(ComponentRemoteConfiguration config) {
    final componentFacade = getComponentFacade(config.componentType);

    if (componentFacade == null) {
      print("ComponentType and ComponentPayload is not matching");
      return {};
    }

    final payloadJson = componentFacade.payloadToJson(config.componentPayload);

    if (payloadJson == null) {
      return null;
    }

    return {}
      ..addAll({'type': config.componentType})
      ..addAll(payloadJson);
  }

  static ComponentFacade? getComponentFacade(String componentType) {
    return allComponents.firstWhereOrNull(
      (element) => element.componentType() == componentType,
    );
  }
}

void mapChangeNullToStringNULL(Map map) {
  changeMapValues(map, (map, key, value) {
    if (value == null) {
      map[key] = "NULL";
    }
  });
}

void mapChangeStringNULLToNull(Map map) {
  changeMapValues(map, (map, key, value) {
    if (value == "NULL") {
      map[key] = null;
    }
  });
}

void changeMapValues(
  Map map,
  Function(Map map, dynamic key, dynamic value) onItem,
) {
  map.forEach((key, value) {
    if (value is Map) {
      changeMapValues(value, onItem);
    } else if (value is List) {
      for (var element in value) {
        changeMapValues(element, onItem);
      }
    } else {
      onItem(map, key, value);
    }
  });
}
