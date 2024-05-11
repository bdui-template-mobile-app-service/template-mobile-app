import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:graduate_work/ui_configuration_mapper/components/components_factory/components_factory.dart';

abstract class IComponentRemotePayload extends Equatable {
  IComponentRemotePayload copyWith({Function()? onTapAction});
  void updateFields(Map<String, dynamic> json);
  List<ComponentRemoteConfiguration> getChildren();
  void setChildren(List<ComponentRemoteConfiguration> children);
}

@JsonSerializable(createFactory: false, createToJson: false)
class ComponentRemoteConfiguration extends Equatable {
  String componentType;
  IComponentRemotePayload componentPayload;

  ComponentRemoteConfiguration(this.componentType, this.componentPayload);

  Widget? makeWidget(Map<String, dynamic> dataContext) {
    return ComponentsFactory.makeComponentFrom(this, dataContext);
  }

  factory ComponentRemoteConfiguration.fromJson(Map<String, dynamic> json) {
    final config = ComponentsFactory.makeRemoteConfigurationFrom(json);
    if (config == null) {
      throw "ComponentConfiguration parse error";
    }
    return config;
  }

  Map<String, dynamic> toJson() {
    final json = ComponentsFactory.toJson(this);
    if (json == null) {
      throw "ComponentConfiguration parse error";
    }
    return json;
  }

  @override
  List<Object?> get props => [componentType, componentPayload];

  ComponentRemoteConfiguration copyWith({
    Function()? onTapAction,
  }) {
    return ComponentRemoteConfiguration(
        componentType,
        componentPayload.copyWith(
          onTapAction: onTapAction,
        ));
  }

  void updateType(String type) {
    if (componentType == type) {
      return;
    }
    componentType = type;

    final config = ComponentsFactory.makeDefaultedRemoteConfiguration(type);
    if (config == null) {
      throw "ComponentConfiguration parse error";
    }
    componentPayload = config.componentPayload;
  }

  void updateFields(Map<String, dynamic> json) {
    componentPayload.updateFields(json);
  }
}
