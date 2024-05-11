import 'package:graduate_work/ui_configuration_mapper/components/core/component_remote_configuration.dart';

extension PreparedToCanvas on ComponentRemoteConfiguration {
  ComponentRemoteConfiguration preparedToCanvas(
      Function(ComponentRemoteConfiguration) onTapAction) {
    final prepared = copyWith(onTapAction: () => onTapAction(this));

    final preparedChildren = prepared.componentPayload
        .getChildren()
        .map((e) => e.preparedToCanvas(onTapAction))
        .toList();
    prepared.componentPayload.setChildren(preparedChildren);

    return prepared;
  }
}
